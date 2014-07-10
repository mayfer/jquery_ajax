require 'rubygems'

require "sinatra"
require "sinatra/activerecord"

require_relative "database"
require_relative "application"
require_relative "contact"
require_relative "menu"

set :database, "sqlite3:///db.sqlite"

# Get all contacts
get "/" do
    # get all contacts from database, sort them alphabetically
	@contacts = Contact.order("first_name")
    
    # read the existing cookie for favorites
    cookie = request.cookies['favorites']

    if cookie == nil
        # if the cookie doesn't exist, assume an empty array of favorites
        contact_ids = []
    else
        # if the cookie does exist, assume the favorited ID's are separated by &'s
        contact_ids = cookie.split('&')
    end

    # send the array of contact id's into the erb template
    @favorites = contact_ids

    if request.xhr?
        @contacts.to_json
    else
        erb :"pages/index"
    end
end

# Create contact
get "/pages/new" do
	@title = "New Contact"
	@contact = Contact.new
	erb :"pages/new"
end

# Check contact for validity
post "/pages" do
	@contact = Contact.new(params[:contact])

    puts params[:contact].inspect

    if request.xhr?
        if @contact.save
            @contact.to_json
        else
            status 406
            @contact.errors.full_messages.to_json
        end
    else
        if @contact.save
            redirect "/pages/#{@contact[:id]}/show"
        else
            erb :"/pages/new"
        end
    end
end

# Edit contact
get "/pages/:id/edit" do
	@title = "Edit Contact"
	@contact = Contact.find(params[:id])
	erb :"pages/edit"
end

# Check edits for validity
put "/pages/:id" do
	@contact = Contact.find(params[:id])
	if @contact.update(params[:contact])
		redirect "/pages/#{@contact[:id]}/show"
	else
		erb :"pages/edit"
	end
end

# Show individual contact information
get "/pages/:id/show" do
	@contact = Contact.find(params[:id])
	@title = @contact[:first_name]
	erb :"pages/show"
end

# Destroy contact from database (kept in 'memory')
delete "/pages/:id" do
	@contact = Contact.find(params[:id]).destroy
	redirect "/"
end


get "/favorite/:id" do

    # read the favorites cookie
    cookie = request.cookies['favorites']

    if cookie == nil
        # same as before, if cooke doesn't exist, initialize our array as empty
        contact_ids = []
    else
        # if cookie DOES exist, turn the ampersand-joined string of ID's into an array of ID's.
        contact_ids = cookie.split('&')
    end

    # add the ID of the contact who's star was clicked on
    contact_ids << params[:id]

    # set the new cookie with its new value, that also includes the new contact ID now
    response.set_cookie(:favorites, {:value=>contact_ids, :path => '/'})

    # redirect user back to homepage to see their updated favorites.
    redirect "/"
end

# Helpers
helpers do

	def title
		if @title
			"#{@title}"
		else
			"My Contacts"
		end
	end

	def delete_contact_button(contact_id)
		erb :_delete_contact_button, locals: { contact_id: contact_id }
	end

end
