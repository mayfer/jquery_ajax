require 'rubygems'
require 'bundler/setup'

require "sinatra"
require "sinatra/activerecord"

require_relative "database"
require_relative "application"
require_relative "contact"
require_relative "menu"

set :database, "sqlite3:///db.sqlite"

# Get all contacts
get "/" do
	@contacts = Contact.order("id")
	erb :"pages/index"
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
	if @contact.save
		redirect "/pages/#{@contact[:id]}/show"
	else
		erb :"/pages/new"
	end
end

# Edit contact
get "/pages/:id/edit" do
	@title = "Edit Contact"
	@contact = Contact.find(params[:id])
	erb :"pages/edit"
end

# Check edits for validity
post "/pages/:id" do
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