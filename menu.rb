class Menu

	# Prints the main menu
  def show_main_menu
    puts "------------MainMenu------------"
    puts "--------------------------------"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show     - Display contact details"
    puts " quit     - Terminate Program"
    print "> "
  end

  # Handle menu choice
  def menu_choice(input)
    case input
    when "new"
      new_contact
    when "list"
      list_contacts
    when "show"
      find_contact_by_id
    when "quit"
      quit_program
    when "print"
      puts "Email: #{@contacts[0][2]}"
    else
      puts "Please enter a valid command!"
    end
  end

  # Prints the edit menu
  def show_edit_menu
    puts "------------EditMenu------------"
    puts "--------------------------------"
    puts " edit     - Edit contact info"
    puts " back     - Return to Main Menu"
    puts " quit     - Terminate Program"
    print "> "
  end

  # Handle edit menu choice
  def edit_menu_choice(input)
    case input
    when "edit"
      edit_contact_info
    when "quit"
      quit_program
    when "back"
      return
    else
      puts "Please enter a valid command!"
    end
  end

end