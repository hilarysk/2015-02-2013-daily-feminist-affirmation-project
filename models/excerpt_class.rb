require_relative "class-module.rb"
require_relative "instance-module.rb"


# Class: Excerpt
#
# Creates different excerpts and gets information about them.
#
# Attributes:
# @text      - String: Text of Excerpt
# @id        - Integer: Excerpt ID, primary key for excerpts table
# @source    - String: Source of excerpt
# @person_id - Integer: Foreign key linked to ID primary key from persons table
#
# attr_reader :id
# attr_accessor :person_id, :source, :text
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Excerpt
  extend FeministClassModule
  include FeministInstanceModule

  
  attr_reader :id
  attr_accessor :person_id, :source, :text


  # Private: initialize
  # Starts and then plays the game with the provided players.
  #
  # Parameters:
  # options - Hash
  #           - @text      - String: Text of Excerpt
  #           - @id        - Integer: Excerpt ID, primary key for excerpts table
  #           - @source    - String: Source of excerpt (magazine, book, song, etc.)
  #           - @person_id - Integer: Foreign key linked to ID primary key from persons table
  #          
  # Returns:
  # Nil
  #
  # State Changes:
  # Sets instance variables @text, @id, @source, @person_id     
                               
  def initialize(options)
    @id = options["id"]
    @text = options["text"]
    @source = options["source"]
    @person_id = options["person_id"]
  end
  
  
  def insert
    DATABASE.execute("INSERT INTO excerpts (text, source, person_id) VALUES 
                    ('#{@text}', '#{@source}', #{@person_id})")
    @id = DATABASE.last_insert_row_id
  end

    
end