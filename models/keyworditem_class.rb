require_relative "class-module.rb"
require_relative "instance-module.rb"

# Class: Match
#
# Creates keyword-term pairs
#
# Attributes:
# @keyword_id    - Integer: ID for the keyword (primary key from the keywords table)
# @item_id      - Integer: ID for the item (primary key ID from corresponding table)
#
# attr_accessor :item_id, :keyword_id
#
# Public Methods:
# #insert
# 
# Private Methods:
# #initialize

class KeywordsTerms
  extend FeministClassMethods
  include FeministInstanceMethods

  attr_accessor :item_id, :keyword_id, :item_table_id


  # Private: initialize
  # Grabs information for keyword-value pair
  #
  # Parameters:
  # options - Hash
  #           - @item_id       - Instance variable representing the ID of the particular term
  #           - @keyword_id    - Instance variable representing the ID of the keyword
  #           - @item_table_id - Represents table of item
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @keyword_id, @item_id, @item_table_id
                               
  def initialize(options)
    @keyword_id = options["keyword_id"]
    @item_id = options["item_id"]
    @item_table_id = options["item_table_id"]
  end
  
  # Public: insert
  # Inserts the information collected in initialize into the proper table
  #
  # Parameters:
  # None
  #
  # Returns:
  # @id
  #
  # State Changes:
  # None
  
  def insert
    DATABASE.execute("INSERT INTO keywords_terms (keyword_id, item_id, item_table_id) VALUES 
                    (#{@keyword_id}, #{@item_id}, #{@item_table_id})")
    @id = DATABASE.last_insert_row_id
  end

    
end