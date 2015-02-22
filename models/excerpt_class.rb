require_relative "class-module.rb"
require_relative "instance-module.rb"


# Class: Excerpt
#
# Creates different excerpts and gets information about them.
#
# Attributes:
# @excerpt   - String: Text of Excerpt
# @id        - Integer: Excerpt ID, primary key for excerpts table
# @source    - String: Source of excerpt
# @person_id - Integer: Foreign key linked to ID primary key from persons table
#
# attr_reader :id
# attr_accessor :person_id, :source, :excerpt
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Excerpt
  extend FeministClassMethods
  include FeministInstanceMethods

  
  attr_reader :id
  attr_accessor :person_id, :source, :excerpt


  # Private: initialize
  # Starts and then plays the game with the provided players.
  #
  # Parameters:
  # options - Hash
  #           - @excerpt   - String: Text of Excerpt
  #           - @id        - Integer: Excerpt ID, primary key for excerpts table
  #           - @source    - String: Source of excerpt (magazine, book, song, etc.)
  #           - @person_id - Integer: Foreign key linked to ID primary key from persons table
  #          
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @excerpt, @id, @source, @person_id   
                               
  def initialize(options)
    @id = options["id"]
    @excerpt = options["excerpt"]
    @source = options["source"]
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
    DATABASE.execute("INSERT INTO excerpts (excerpt, source, person_id) VALUES 
                    ('#{@excerpt}', '#{@source}', #{@person_id})")
    @id = DATABASE.last_insert_row_id
  end

    
end