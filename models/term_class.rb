require_relative "class-module.rb"
require_relative "instance-module.rb"


# Class: Term
#
# Creates different products and gets information about them.
#
# Attributes:
# @id         - Integer: Instance variable representing the term ID (primary key)
# @definition - String: Variable representing the term's definition
# @term       - String: Variable representing the term 
#
# attr_reader :id
# attr_accessor :definition, :text
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Term
  extend FeministClassMethods
  include FeministInstanceMethods
  

  
  attr_reader :id
  attr_accessor :definition, :term

  # Private: initialize
  # Gets information to create new quotes
  #
  # Parameters:
  # options - Hash
  #           - @id         - Instance variable representing the term ID (primary key)
  #           - @definition - Instance variable representing the term's definition
  #           - @term       - Instance variable representing the term 
  #
  # Returns:
  # An object of the class
  #
  # State Changes:
  # Sets instance variables @id, @definition, @term     
                               
  def initialize(options)
    @id = options["id"]
    @term = options["term"]
    @definition = options["definition"]
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
    DATABASE.execute("INSERT INTO terms (term, definition) VALUES 
                    ('#{@term}', '#{@definition}')")
    @id = DATABASE.last_insert_row_id
  end




    
end