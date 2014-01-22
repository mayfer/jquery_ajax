# Contact.rb
require 'colorize'

class Contact

  attr_accessor :first, :last, :email
  @@contacts = []
  
  def initialize(first, last, email)
    @id = @@contacts.size
    @first = first
    @last = last
    @email = email
  end

  def self.email_used?(email)
    @@contacts.detect { |contact| email == contact.email }
  end

  def self.create(first, last, email)
    @@contacts << new(first, last, email)
  end

  def to_s
    "ID: #{@id} | #{@first} #{@last} (#{@email})"
  end

  def display_contact(id)
    puts "#{@@contacts[id.to_i]}".light_red
  end

  def display_contacts
    @@contacts.each { |contact| puts "#{contact}".light_red }
  end

  def self.delete_contact(id)
    @@contacts.delete(id)
  end

  def edit_name(id)
    first, last = get_name
    @@contacts[id].first = first
    @@contacts[id].last = last
  end

  def edit_email(id)
    puts "Enter email: "
    @@contacts[id].email = user_input
  end
  
end