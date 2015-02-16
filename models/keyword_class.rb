require_relative "class-module.rb"
require_relative "instance-module.rb"


# Class: Keyword
#
# Creates different keywords and assigns them to an ID
#
# Attributes:
# @keyword - Instance variable representing the actual keyword
# @id      - Instance variable representing the keyword ID within the table (primary key)
#
# attr_reader :id
# attr_accessor :keyword
#
# Public Methods:
# 
# Private Methods:
# #initialize

class Keyword
  extend FeministClassModule
  include FeministInstanceModule

  
  attr_reader :id
  attr_accessor :keyword


  # Private: initialize
  # Creates new keywords
  #
  # Parameters:
  # options - Hash
  #           - @keyword - Instance variable representing the actual keyword
  #           - @id      - Instance variable representing the keyword ID within the table (primary key)
  #
  # Returns:
  # Nil
  #
  # State Changes:
  # Sets instance variables @keyword and @id     
                               
  def initialize(options)
    @id = options["id"]
    @keyword = options["keyword"]
  end
  
  
  def insert
    DATABASE.execute("INSERT INTO keywords (keyword) VALUES 
                    ('#{@keyword})")
    @id = DATABASE.last_insert_row_id
  end

    
end