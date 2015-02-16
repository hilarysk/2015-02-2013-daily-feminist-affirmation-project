require_relative "class-module.rb"
require_relative "instance-module.rb"

# Class: Like
#
# Creates different like-item pairs
#
# Attributes:
# @user_ip    - String: User's IP address
# @item_id    - Integer: ID for the item (primary key ID from corresponding table)
# @item_table - String: Name of table which @item_id references 
#
# attr_accessor :item_id, :user_ip, :item_table
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Like
  extend FeministClassModule
  include FeministInstanceModule

  attr_accessor :item_id, :user_ip, :item_table


  # Private: initialize
  # Gets information for like-item pair
  #
  # Parameters:
  # options - Hash
  #           - @item_table - Instance variable representing the table where the item lives
  #           - @item_id    - Instance variable representing the ID of the particular item
  #           - @user_ip    - Instance variable representing the IP address of the user
  # Returns:
  # Nil
  #
  # State Changes:
  # Sets instance variables @user_ip, @item_id, @item_table
                               
  def initialize(options)
    @user_ip = options["user_ip"]
    @item_id = options["item_id"]
    @item_table = options["item_table"]
  end
  
  
  def insert
    DATABASE.execute("INSERT INTO likes (user_ip, item_id, item_table) VALUES 
                    ('#{@user_ip}', #{@item_id}, '#{@item_table}')")
  end

    
end