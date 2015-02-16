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
#
# attr_accessor :item_id, :keyword_id, :item_table
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Match
  extend FeministClassModule
  include FeministInstanceModule

  attr_accessor :item_id, :keyword_id, :item_table


  # Private: initialize
  # Grabs information for keyword-value pair
  #
  # Parameters:
  # options - Hash
  #           - @item_table - Instance variable representing the table where the item lives
  #           - @item_id    - Instance variable representing the ID of the particular item
  #           - @keyword_id - Instance variable representing the ID of the keyword
  # Returns:
  # Nil
  #
  # State Changes:
  # Sets instance variables @keyword_id, @item_id, @item_type     
                               
  def initialize(options)
    @keyword_id = options["keyword_id"]
    @item_id = options["item_id"]
    @item_table = options["item_table"]
  end
  
  
  def insert
    DATABASE.execute("INSERT INTO matches (keyword_id, item_id, item_table) VALUES 
                    ('#{@keyword_id}', #{@item_id}, '#{@item_table}')")
  end

    
end