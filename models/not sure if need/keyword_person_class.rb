require_relative "class-module.rb"
require_relative "instance-module.rb"

# Class: Match
#
# Creates keyword-person pairs
#
# Attributes:
# @keyword_id    - Integer: ID for the keyword (primary key from the keywords table)
# @person_id      - Integer: ID for the item (primary key ID from persons table)
#
# attr_accessor :person_id, :keyword_id
#
# Public Methods:
# #insert
# 
# Private Methods:
# #initialize

class KeywordPerson
  extend FeministClassMethods
  include FeministInstanceMethods

  attr_accessor :person_id, :keyword_id


  # Private: initialize
  # Grabs information for keyword-value pair
  #
  # Parameters:
  # options - Hash
  #           - @person_id     - Instance variable representing the ID of the particular person
  #           - @keyword_id    - Instance variable representing the ID of the keyword
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @keyword_id, @person_id,    
                               
  def initialize(options)
    @keyword_id = options["keyword_id"]
    @person_id = options["person_id"]
  end
  
  # Public: insert
  # Inserts the information collected in initialize into the proper table
  #
  # Parameters:
  # None
  #
  # Returns:
  # Empty array
  #
  # State Changes:
  # None
  
  def insert
    DATABASE.execute("INSERT INTO keywords_persons (keyword_id, person_id) VALUES 
                    (#{@keyword_id}, #{@person_id})")
  end

    
end