require_relative 'contact'
require 'colorize'
class Menu < Contact

  # Prints the main menu
  def show_main_menu
    puts "-------------MainMenu-------------".yellow.underline
    puts "----What would you like to do?----".yellow
    puts " New    - Create a new contact".green
    puts " List   - List all contacts".green
    puts " Show   - Display contact details".green
    puts " Quit   - Terminate Program".green
    print "> ".magenta
  end

  # Handle main menu choice
  def menu_choice(input)
    case input
    when "new"
      new_contact
    when "list"
      list_contacts
    when "show"
      puts "Enter id: ".cyan
      search = gets.chomp.to_i
      find_contact_id(search)
    when "quit"
      quit_program
    when "colors"
      puts "#{String.color_matrix}"
      puts "#{String.modes}"
    else
      puts "Please enter a valid command!".red
    end
  end

  # Prints the edit menu
  def show_edit_menu
    puts "-------------EditMenu-------------".yellow.underline
    puts "---What would you like to edit?---".yellow
    puts " Name   - Edit contact name".green
    puts " Phone  - Edit phone number(s)".green
    puts " Email  - Edit contact email".green
    puts " Delete - Delete contact".green
    puts " Back   - Return to Main Menu".green
    print "> ".magenta
  end

  # Handle edit menu choice
  def edit_menu_choice(input)
    case input
    when "name"
      edit_name
    when "email"
      edit_email
    when "phone"
      add_phone
    when "delete"
      delete_contact
    when "back"
      return
    else
      puts "Please enter a valid command!".red
    end
  end

end