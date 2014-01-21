class Application
 
  def initialize
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    @contacts = [
      ["Michael ", "Excellent ", "(Excellent@email.com)"],
      ["Jackie ", "Speedy ", "(Speedy@another_email.com)"],
      ["Jane ", "Super ", "(Super@yet_another_email.com)"],
      ["Fictional ", "Imaginary ", "(not_real@making_up_emails.com)"],
      ["Larry ", "Fantastic ", "(Fantastic@omg_so_many_email_addresses.com)"]
    ]
    @running = true
  end

  # Main game loop (REPL)
  def run
    while @running == true do
      show_main_menu
      input = gets.chomp
      menu_choice(input)
    end
  end
  
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
    print "> "
  end

  # Handle edit menu choice
  def edit_menu_choice(input)
    case input
    when "edit"
      edit_contact_info
    when "back"
      return
    else
      puts "Please enter a valid command!"
    end
  end

  # Create new contact
  def new_contact
    puts "Email: "
    email = gets.chomp
    exists = false
    @contacts.each_with_index do |contact, contact_id|
      if "(#{email})" == @contacts[contact_id][2]
        puts "-----Email already in use!!-----"
        exists = true
      end
    end
    if exists != true
      puts "Name: "
      name = gets.chomp
      my_new_contact = Contact.new(name, email)
      @contacts << my_new_contact.to_s
    end
  end

  # Gather new contact info and update
  def edit_contact_info
    puts "First Name: "
    first_name = gets.chomp
    puts "Last Name: "
    last_name = gets.chomp
    puts "Email: "
    email = gets.chomp
    # TODO: assign input to contact variables
    @contacts[] = ["#{first_name} ", "#{last_name} ", "(#{email})"]
  end

  # Display all contacts
  def list_contacts
    @contacts.each_with_index do |contact, contact_id|
      my_contact = @contacts[contact_id].join
      puts "# #{contact_id}: #{my_contact}"
    end
  end

  # Find individual contact by searching id
  def find_contact_by_id
    found = false
    puts "Enter id: "
    search_id = gets.chomp.to_i
    @contacts.each_with_index do |contact, contact_id|
      if search_id == contact_id
        my_contact = @contacts[contact_id].join
        puts "# #{contact_id}: #{my_contact}"
        found = true
      end
    end
    found_contact(found)
  end

  # Display found contact info or error
  def found_contact(found)
    if found != true
      puts "Contact not found"
    else
      show_edit_menu
      input = gets.chomp
      edit_menu_choice(input)
    end
  end

  # Quit program
  def quit_program
    puts "Goodbye!"
    @running = false
  end
 
end