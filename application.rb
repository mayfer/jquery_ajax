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

  def user_input
    gets.chomp.strip
  end

  # Helper methods
  
  def find_contact
    puts "Enter ID: ".cyan
    @contact = Contact.find(user_input.to_i)
  end

  def search_contacts
    puts "Find: "
    search = user_input
    Contact.find_each do |c|
      if (c.first_name).include?search
        put_contact_info(c)
      end
    end
  end

end