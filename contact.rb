class Contact
  
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  
  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @email = email
    @name = name
    @first_name = name.split.first
    @last_name = name.split.last
  end
  
  def to_s
    # TODO: return string representation of Contact
    contact_string = ["#{@first_name} ", "#{@last_name} ", "(#{@email})"]
    return contact_string
  end
  
end