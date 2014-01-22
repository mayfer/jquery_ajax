# Menu
require 'colorize'
require_relative 'contact'
class Menu < Contact

  def show_main_menu
    menu_lines
    puts "------------------Main Menu------------------".light_blue
    menu_lines
    puts " New        - Create new contact".green
    puts " List       - Display all contacts".green
    puts " Show       - Display individual contact".green
    puts " Important  - Display contacts by importance".green
    puts " Search     - Search contacts by first name".green
    puts " Quit       - Exit Program".green
    print "> ".magenta
  end

  def show_edit_menu
    menu_lines
    puts "------------------Edit Menu------------------".light_blue
    menu_lines
    puts " Name       - Edit contact name".green
    puts " Email      - Edit contact email".green
    puts " Importance - Edit contact importance".green
    puts " Delete     - Delete contact".green
    puts " Back       - Return to Main Menu".green
    print "> ".magenta
  end

  def menu_lines
    puts "---------------------------------------------".light_yellow
  end

  def menu_choice(input)
    case input
    when "new"
      puts input
      create_contact
    when "list"
      display_all_contacts
    when "show"
      find_contact
      display_contact(@contact)
      show_edit_menu
      edit_menu_choice(user_input)
    when "important"
      display_important
    when "search"
      search_contacts
    when "quit", "q"
      puts "Goodbye!".magenta
      @running = false
    else
      puts "--------Please enter a valid command!--------".red
    end
  end

  def edit_menu_choice(input)
    case input
    when "name"
      edit_name(@contact)
    when "email"
      edit_email(@contact)
    when "importance"
      edit_importance(@contact)
    when "delete"
      delete_contact(@contact)
    when "back"
      return
    else
      puts "--------Please enter a valid command!--------".red
    end
  end

end