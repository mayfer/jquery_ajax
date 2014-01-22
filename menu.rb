# Menu.rb
require 'colorize'
require_relative 'contact'

class Menu < Contact

  def show_main_menu
    puts "----------------------------------".light_yellow
    puts "-------------MainMenu-------------".light_blue
    puts "----------------------------------".light_yellow
    puts " New    - Create new contact".green
    puts " List   - Display all contacts".green
    puts " Show   - Display individual contact".green
    puts " Delete - Delete contact".green
    puts " Quit   - Exit Program".green
    print "> ".magenta
  end

  def show_edit_menu
    puts "----------------------------------".light_yellow
    puts "-------------EditMenu-------------".light_blue
    puts "----------------------------------".light_yellow
    puts " Name   - Edit contact name".green
    puts " Email  - Edit contact email".green
    puts " Back   - Return to Main Menu".green
    print "> ".magenta
  end

  def menu_choice(input)
    case input
    when "new", "New"
      create_contact
    when "list", "List"
      display_contacts
    when "show", "Show"
      display_contact(id_input)
      show_edit_menu
      edit_menu_choice(user_input)
    when "delete", "Delete"
      delete_contact(id_input)
    when "quit", "Quit", "q", "Q"
      puts "Goodbye!".magenta
      @running = false
    else
      puts "Please enter a valid command!".red
    end
  end

  def edit_menu_choice(input)
    case input
    when "name", "Name"
      edit_name(id_input)
    when "email", "Email"
      edit_email(id_input)
    when "back", "Back"
      return
    else
      puts "Please enter a valid command!".red
    end
  end

  def id_input
    puts "Enter ID: ".cyan
    user_input.to_i
  end

  def user_input
    gets.chomp.strip
  end

end