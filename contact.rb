require 'colorize'
class Contact
  
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  
  def initialize(id, name, email)
    @email = email
    @name = name
    @first_name = name.split.first
    @last_name = name.split.last
    @id = id
  end
  
  # Return contact info as a hash
  def to_hash
    return {id: @id, fname: @first_name, lname: @last_name, email: @email}
  end

  # Edit contact name
  def edit_name
    puts "First Name: ".colorize(:cyan)
    @found_contact[:fname] = gets.chomp
    puts "Last Name: ".colorize(:cyan)
    @found_contact[:lname] = gets.chomp
    puts "-------------Updated!-------------".colorize(:green)
  end

  # Edit contact email
  def edit_email
    puts "Email: ".colorize(:cyan)
    @found_contact[:email] = gets.chomp
    puts "-------------Updated!-------------".colorize(:green)
  end

  # Delete contact
  def delete_contact
    @contacts.delete(@found_contact)
    puts "-------------Deleted!-------------".colorize(:red)
  end
  
end