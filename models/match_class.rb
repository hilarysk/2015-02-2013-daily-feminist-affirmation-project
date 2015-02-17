require_relative "class-module.rb"
require_relative "instance-module.rb"

# Class: Match
#
# Creates keyword-item pairs
#
# Attributes:
# @keyword_id - Integer: ID for the keyword (primary key from the keywords table)
# @item_id    - Integer: ID for the item (primary key ID from corresponding table)
# @item_table - String: Name of table which @item_id references 
# @id         - Integer: ID for the record (primary key)
#
# attr_accessor :item_id, :keyword_id, :item_table
# arrr_reader :id
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Match
  extend FeministClassMethods
  include FeministInstanceMethods

  attr_accessor :item_id, :keyword_id, :item_table
  attr_reader :id


  # Private: initialize
  # Grabs information for keyword-value pair
  #
  # Parameters:
  # options - Hash
  #           - @item_table - Instance variable representing the table where the item lives
  #           - @item_id    - Instance variable representing the ID of the particular item
  #           - @keyword_id - Instance variable representing the ID of the keyword
  #           - @id         - Instance variable representing the ID of the record (primary key)
  # Returns:
  # The object
  #
  # State Changes:
  # Sets instance variables @id, @keyword_id, @item_id, @item_type     
                               
  def initialize(options)
    @id = options["id"]
    @keyword_id = options["keyword_id"]
    @item_id = options["item_id"]
    @item_table = options["item_table"]
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
    DATABASE.execute("INSERT INTO matches (keyword_id, item_id, item_table) VALUES 
                    ('#{@keyword_id}', #{@item_id}, '#{@item_table}')")
    @id = DATABASE.last_insert_row_id
  end

    
end