require_relative "class-module.rb"
require_relative "instance-module.rb"


# Class: Person
#
# Creates different people and gets information about them.
#
# Attributes:
# @name    - String: Name of person
# @id      - Integer: Person ID, primary key for persons table
# @bio     - String: Number of products in inventory
# @state   - String: State where person was born
# @country - String: Country where person was born
#
# attr_reader :id
# attr_accessor :country, :bio, :state, :name
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Person
  extend FeministClassMethods
  include FeministInstanceMethods

  
  attr_reader :id
  attr_accessor :country, :bio, :state, :name

  # Private: initialize
  # Starts and then plays the game with the provided players.
  #
  # Parameters:
  # options - Hash
  #           - @name    - Instance variable representing the person's name
  #           - @state   - Instance variable representing the person's state
  #           - @bio     - Instance variable representing the person's short biography 
  #           - @country - Instance variable representing the person's country
  #           - @id      - Instance variable representing the person's ID within the table (primary key)
  #
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @name, @state, @country, @bio, @id     
                               
  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @bio = options["bio"]
    @state = options["state"]
    @country = options["country"]
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
    DATABASE.execute("INSERT INTO products (name, bio, state, country) VALUES 
                    ('#{@name}', '#{@bio}', '#{@state}', '#{@country}')")
    @id = DATABASE.last_insert_row_id
  end

    
end