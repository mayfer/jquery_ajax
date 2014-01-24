class Menu

  def self.show_main_menu
    puts "---------------------------------------------".light_yellow
    puts "------------------Main Menu------------------".light_blue
    puts "---------------------------------------------".light_yellow
    puts " New        - Create new contact".green
    puts " List       - Display all contacts".green
    puts " Show       - Display individual contact".green
    puts " Important  - Display contacts by importance".green
    puts " Search     - Search contacts by first name".green
    puts " Quit       - Exit Program".green
    print "> ".magenta
  end

  def show_edit_menu
    puts "---------------------------------------------".light_yellow
    puts "------------------Edit Menu------------------".light_blue
    puts "---------------------------------------------".light_yellow
    puts " Name       - Edit contact name".green
    puts " Phone      - Add/Edit contact phone numbers".green
    puts " Email      - Edit contact email".green
    puts " Importance - Edit contact importance".green
    puts " Delete     - Delete contact".green
    puts " Back       - Return to Main Menu".green
    print "> ".magenta
  end

  def self.menu_choice(input)
    case input
    when "new"
      Contact.create_contact
    when "list"
      Contact.display_all_contacts
    when "show"
      find_contact
      Contact.display_contact(@curent_contact)
      show_edit_menu
      edit_menu_choice(user_input)
    when "important"
      Contact.display_important
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
      Contact.edit_name(@curent_contact)
    when "email"
      Contact.edit_email(@curent_contact)
    when "importance"
      Contact.edit_importance(@curent_contact)
    when "phone"
      Contact.add_number(@curent_contact)
    when "delete"
      Contact.delete_contact(@curent_contact)
    when "back"
      return
    else
      puts "--------Please enter a valid command!--------".red
    end
  end

end