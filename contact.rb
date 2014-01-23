# Contact
require 'colorize'
require_relative 'database'
class Contact < ActiveRecord::Base

  has_many :phone_number

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :importance, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  def create_contact
    first, last, email, importance = get_contact_info
    new_contact = Contact.create(first_name: first, last_name: last, email: email, importance: importance)
    !new_contact.valid? ? (puts "Error(s): #{new_contact.errors.full_messages}".red) : (puts "Success: Contact created!".green)
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
      (1..5).include?(c.importance) ? put_contact_info(c) : return
    end
  end

  def put_contact_info(c)
    puts "ID: #{c.id} | #{c.first_name} #{c.last_name} (#{c.email})".magenta
  end

  def edit_name(c)
    puts "First Name: "
    c.update(first_name: user_input)
    puts "Last Name: "
    c.update(last_name: user_input)
  end

  def edit_email(c)
    puts "Email: "
    c.update(email: user_input)
  end

  def edit_importance(c)
    puts "Importance: "
    c.update(importance: user_input.to_i)
  end

  def delete_contact(c)
    c.destroy
  end
  
end