require_relative 'menu'
require 'colorize'
class Application < Menu
 
  def initialize
    @id = 5
    @running = true
    @contacts = [
    {id: 0, fname: "Invisible", lname: "Excellent", email: "Excellent@email.com"},
    {id: 1, fname: "Imaginary", lname: "Speedy",    email: "Speedy@another_email.com"},
    {id: 2, fname: "Not Real",   lname: "Super",     email: "Super@yet_another_email.com"},
    {id: 3, fname: "Fictional", lname: "Wonderful", email: "Wonderful@making_up_emails.com"},
    {id: 4, fname: "Hidden",    lname: "Fantastic", email: "Fantastic@omg_so_many_email_addresses.com"}]
  end

  # Main app loop
  def run
    while @running == true do
      show_main_menu
      input = gets.chomp
      menu_choice(input)
    end
  end

  # Display all contacts
  def list_contacts
    @contacts.each do |contact|
      puts "#{contact[:id]}: #{contact[:fname]} #{contact[:lname][0,1]} (#{contact[:email]})".colorize(:light_blue)
    end
  end

  # Quit program
  def quit_program
    puts "Goodbye!".magenta
    @running = false
  end

  # Create new contact
  def new_contact
    puts "Email: ".colorize(:cyan)
    email = gets.chomp
    if contact_exists?(email) == false
      puts "Name: ".colorize(:cyan)
      name = gets.chomp
      new_contact = Contact.new(@id, name, email)
      @id += 1
      @contacts << new_contact.to_hash
    end
  end

  # Check if contact exists
  def contact_exists?(email)
    exists = false
    @contacts.each do |contact|
      if email == contact[:email]
        puts "-----Email already in use!!-----".colorize(:red)
        exists = true
      end
    end
    return exists
  end

  # Find individual contact by searching id
  def find_contact_id(search)
    @found_contact = nil
    @contacts.each do |contact|
      if search == contact[:id]
        @found_contact = contact
      end
    end
    display_found_contact(@found_contact)
  end

  # Display found contact info or error
  def display_found_contact(found_contact)
    if found_contact != nil
      puts "#{found_contact[:id]}: #{found_contact[:fname]} #{found_contact[:lname]} (#{found_contact[:email]})".colorize(:light_blue)
      show_edit_menu
      input = gets.chomp
      edit_menu_choice(input)
    else
      puts "Contact not found".colorize(:red)
    end
  end
 
end