require_relative "class-module.rb"
require_relative "instance-module.rb"


# Class: Quote
#
# Creates different products and gets information about them.
#
# Attributes:
# @text      - String: Text of quote
# @id        - Integer: Quote ID, primary key for quotes table
# @person_id - Integer: ID from persons table (foreign key)
#
# attr_reader :id
# attr_accessor :person_id, :text
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Quote
  extend FeministClassMethods
  include FeministInstanceMethods
  

  
  attr_reader :id
  attr_accessor :person_id, :text

  # Private: initialize
  # Gets information to create new quotes
  #
  # Parameters:
  # options - Hash
  #           - @id        - Instance variable representing the quote ID (primary key)
  #           - @person_id - Instance variable representing the quoter's ID (persons table primary key)
  #           - @text      - Instance variable representing the quote text 
  #
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @id, @person_id, @text     
                               
  def initialize(options)
    @id = options["id"]
    @text = options["text"]
    @person_id = options["person_id"]
  end
  
  # Public: insert
  # Inserts the information collected in initialize into the proper table
  #
  # Parameters:
  # None
  #
  # Returns:
  # The object's id number
  #
  # State Changes:
  # Sets @id instance variable
  
  def insert
    DATABASE.execute("INSERT INTO quotes (text, person_id) VALUES 
                    ('#{@text}', #{@person_id})")
    @id = DATABASE.last_insert_row_id
  end

    
end