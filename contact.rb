# Contact
require 'colorize'
require_relative 'database'
class Contact < ActiveRecord::Base

  def create_contact
    first, last, email, importance = get_contact_info
    Contact.create(first_name: first, last_name: last, email: email, importance: importance)
  end

  def edit_name(contact)
    puts "First Name: "
    first_name = user_input
    puts "Last Name: "
    last_name = user_input
    contact.update(first_name: first_name, last_name: last_name)
  end

  def edit_email(contact)
    puts "Email: "
    email = user_input
    contact.update(email: email)
  end

  def edit_importance(contact)
    puts "Importance: "
    importance = user_input.to_i
    contact.update(importance: importance)
  end

  def delete_contact(contact)
    contact.destroy
    puts "#{contact.first_name} #{contact.last_name} removed."
  end
  
end