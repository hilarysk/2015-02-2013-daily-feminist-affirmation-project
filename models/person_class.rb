require_relative "class-module.rb"
require_relative "instance-module.rb"


# Class: Person
#
# Creates different people and gets information about them.
#
# Attributes:
# @name    - String: Name of person
# @id      - Integer: Person ID, primary key for persons table
# @bio     - String: Person's biography
# @state   - String: State where person was born
# @country - String: Country where person was born
# @image   - String: Link to the person's image
# @caption - String: Caption for image
# @source  - String: Source for the biography
#
# attr_reader :id
# attr_accessor :country, :bio, :state, :name, :caption, :image, :source
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Person
  extend FeministClassMethods
  include FeministInstanceMethods

  
  attr_reader :id
  attr_accessor :country, :bio, :state, :name, :source, :image, :caption

  # Private: initialize
  # Creates new people
  #
  # Parameters:
  # options - Hash
  #           - @name    - the person's name
  #           - @state   - the person's state
  #           - @bio     - the person's short biography 
  #           - @country - the person's country
  #           - @id      - the person's ID within the table (primary key)
  #           - @image   - a link to the person's image
  #           - @caption - the caption for the image
  #           - @source  - the source of the biography
  #
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @name, @state, @country, @bio, @id, @image, @caption, @source
                               
  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @bio = options["bio"]
    @state = options["state"]
    @country = options["country"]
    @image = options["image"]
    @caption = options["caption"]
    @source = options["source"]
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
    DATABASE.execute("INSERT INTO products (name, bio, state, country, image, caption, source) VALUES 
                    ('#{@name}', '#{@bio}', '#{@state}', '#{@country}', '#{@image}', '#{@caption}', '#{@source})")
    @id = DATABASE.last_insert_row_id
  end

    
end