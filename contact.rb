# Contact
require 'colorize'
require_relative 'database'
class Contact < ActiveRecord::Base

  def create_contact
    first, last, email, importance = get_contact_info
    if validate_email(email)
      puts "Email already in use!".red
    else
      Contact.create(first_name: first, last_name: last, email: email, importance: importance)
    end
  end

  def get_contact_info
    puts "First Name: ".cyan
    first = user_input
    puts "Last Name: ".cyan
    last = user_input
    puts "Email: ".cyan
    email = user_input
    puts "Importance: ".cyan
    importance = user_input.to_i
    [first, last, email, importance]
  end

  def display_all_contacts
    Contact.all.each { |c| put_contact_info(c) }
  end

  def display_contact(c)
    put_contact_info(c)
  end

  def display_important
    Contact.order(:importance).reverse_order.each do |c|
      if (1..5).include?(c.importance)
        put_contact_info(c)
      end
    end
  end

  def put_contact_info(c)
    puts "ID: #{c.id} | #{c.first_name} #{c.last_name} (#{c.email})".magenta
  end

  def edit_name(contact)
    puts "First Name: "
    contact.update(first_name: user_input)
    puts "Last Name: "
    contact.update(last_name: user_input)
  end

  def edit_email(contact)
    puts "Email: "
    contact.update(email: user_input)
  end

  def edit_importance(contact)
    puts "Importance: "
    contact.update(importance: user_input.to_i)
  end

  def delete_contact(contact)
    contact.destroy
  end
  
end