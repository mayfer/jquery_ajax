# Phone Numbers
require 'colorize'
require_relative 'database'
class Phone_Number < ActiveRecord::Base

	belongs_to :contact

	def get_number
		puts "Category: "
		label = user_input
    puts "Number (555-555-5555): ".cyan
    number = user_input
    [label, number]
  end

  def add_number(contact)
  	label, number = get_number
  	id = contact.id
  	Phone_Number.create(contact_id: id, label: label, number: number)
  end

end