# Application.rb
require 'colorize'
require_relative 'menu'

class Application < Menu
 
  def initialize
    @running = true
  end

  def run
    create_fictional_people
    while @running
      show_main_menu
      menu_choice(user_input)
    end
  end

  def create_contact
    first, last, email = create_contact_info
    Contact.create(first, last, email)
  end

  def create_contact_info
    puts "Email: ".cyan
    email = gets.chomp
    unless Contact.email_used?(email)
      puts "First Name: ".cyan
      first = gets.chomp
      puts "Last Name: ".cyan
      last = user_input
      [first, last, email]
    else
      puts "Email already in use!".red
    end
  end

  def create_fictional_people
    Contact.create("Imaginary", "Excellent", "Excellent@email.com")
    Contact.create("Invisible", "Speedy", "Speedy@another_email.com")
    Contact.create("Not Real", "Wonderful", "Wonderful@making_up_emails.com")
    Contact.create("Fictional", "Super", "Super@yet_another_email.com")
    Contact.create("Hidden", "Fantastic", "Fantastic@omg_so_many_email_addresses.com")
  end
 
end