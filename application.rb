class Application
 
  def initialize
    @running = true
  end

  def run
    while @running
      Menu.show_main_menu
      Menu.menu_choice(user_input)
    end
  end

  def user_input
    gets.chomp.strip
  end

  # Helper methods
  
  def find_contact
    puts "Enter ID: ".cyan
    @curent_contact = Contact.find(user_input.to_i)
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