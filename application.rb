# Application
require 'colorize'
require_relative 'menu'
class Application < Menu

  @current_contact = nil
 
  def initialize
    @running = true
  end

  def run
    while @running
      show_main_menu
      menu_choice(user_input)
    end
  end

  def display_all_contacts
    Contact.all.each { |c| puts "ID: #{c.id} #{c.first_name} #{c.last_name} (#{c.email})".magenta }
  end

  def display_contact(c)
    puts "ID: #{c.id} | #{c.first_name} #{c.last_name} (#{c.email})".magenta
  end

  def display_important
    Contact.order(:importance).reverse.to_a.each do |c|
      if (1..5).include?(c.importance)
        puts "ID: #{c.id} | #{c.first_name} #{c.last_name} (#{c.email})".magenta
      end
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

  def user_input
    gets.chomp.strip
  end

  def find_contact
    puts "Enter ID: ".cyan
    @contact = Contact.find(user_input.to_i)
  end

end