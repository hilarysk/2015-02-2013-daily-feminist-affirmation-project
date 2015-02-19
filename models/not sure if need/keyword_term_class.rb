require_relative "class-module.rb"
require_relative "instance-module.rb"

# Class: Match
#
# Creates keyword-term pairs
#
# Attributes:
# @keyword_id    - Integer: ID for the keyword (primary key from the keywords table)
# @term_id      - Integer: ID for the item (primary key ID from corresponding table)
#
# attr_accessor :term_id, :keyword_id
#
# Public Methods:
# #insert
# 
# Private Methods:
# #initialize

class KeywordsTerms
  extend FeministClassMethods
  include FeministInstanceMethods

  attr_accessor :term_id, :keyword_id


  # Private: initialize
  # Grabs information for keyword-value pair
  #
  # Parameters:
  # options - Hash
  #           - @term_id       - Instance variable representing the ID of the particular term
  #           - @keyword_id    - Instance variable representing the ID of the keyword
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @keyword_id, @term_id,    
                               
  def initialize(options)
    @keyword_id = options["keyword_id"]
    @term_id = options["term_id"]
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
    DATABASE.execute("INSERT INTO keywords_terms (keyword_id, term_id) VALUES 
                    (#{@keyword_id}, #{@term_id})")
  end

    
end