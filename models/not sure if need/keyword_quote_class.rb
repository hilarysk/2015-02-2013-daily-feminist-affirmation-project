require_relative "class-module.rb"
require_relative "instance-module.rb"

# Class: Match
#
# Creates keyword-quote pairs
#
# Attributes:
# @keyword_id    - Integer: ID for the keyword (primary key from the keywords table)
# @quote_id      - Integer: ID for the item (primary key ID from quotes table)
#
# attr_accessor :quote_id, :keyword_id
#
# Public Methods:
# #insert
# 
# Private Methods:
# #initialize

class KeywordQuote
  extend FeministClassMethods
  include FeministInstanceMethods

  attr_accessor :quote_id, :keyword_id


  # Private: initialize
  # Grabs information for keyword-value pair
  #
  # Parameters:
  # options - Hash
  #           - @quote_id       - Instance variable representing the ID of the particular quote
  #           - @keyword_id    - Instance variable representing the ID of the keyword
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @keyword_id, @quote_id,    
                               
  def initialize(options)
    @keyword_id = options["keyword_id"]
    @quote_id = options["quote_id"]
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
    DATABASE.execute("INSERT INTO keywords_quotes (keyword_id, quote_id) VALUES 
                    (#{@keyword_id}, #{@quote_id})")
  end

    
end