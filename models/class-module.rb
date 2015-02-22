# Module: FeministClassMethods
#
# Toolbox for use in the Daily Feminist Affirmation program; contains class methods that could work for all or most of the classes. 
#
# Public Methods:
# #find_specific_value
# #find_specifc_record
# #find_specifc_record_unformatted
# #delete_secondary_kvpairs
# #delete_record
# #exterminate

module FeministClassMethods
    
  
  def get_array_keywords_for_item(options)
    id_of_item = options["id_of_item"].to_i
    table_name = options["table"].to_s
    
    keywords_array = DATABASE.execute("select keywords.keyword, item_id, items_tables.table_name FROM keywords_items JOIN keywords ON keywords_items.keyword_id = keywords.id JOIN items_tables ON keywords_items.item_table_id = items_tables.id")
    # ==> [{"keyword"=>"Beloved","item_id"=>1, "table_name"=>"excerpts", 0=>"Beloved", 1=>1, 2=>"excerpts"}, {"keyword"=>"United States", "item_id"=>1,"table_name"=>"excerpts", 0=>"United States", 1=>1, 2=>"excerpts"}]
    
    delete_secondary_kvpairs(keywords_array, :placeholder) # ==>keywords_array = [{"keyword"=>"Beloved","item_id"=>1, "table_name"=>"excerpts"}, {"keyword"=>"United States", "item_id"=>1,"table_name"=>"excerpts""}]
    
    keywords = []
    
    keywords_array.each do |hash|
      if hash["item_id"] == id_of_item && hash["table_name"] == "#{table_name}"
        keywords << hash["keyword"]
      end
    end
  
    
    return keywords  #==> ["Beloved", "United States"]
    
  end
  
  
  
  
  
  
    
  def array_of_quote_records
    quotes_array = DATABASE.execute("SELECT quotes.id, quotes.quote, persons.person FROM quotes JOIN persons ON quotes.person_id = persons.id") # returns array of hashes, each has is a record
    
    delete_secondary_kvpairs(quotes_array, :placeholder)
    
    return quotes_array #==> quotes_array = [{"id"=>"1", "quote"=>"sldkjflaskdjfaksldjfaklsdfjasdf", "person"=>"Ella Baker"}]
  
  end  
    
    
  def array_of_excerpt_records
    excerpts_array = DATABASE.execute("SELECT excerpts.id, excerpts.excerpt, excerpts.source, persons.person FROM excerpts JOIN persons ON excerpts.person_id = persons.id") # returns array of hashes, each has is a record
    
    delete_secondary_kvpairs(excerpts_array, :placeholder)
    
    return excerpts_array #==> excerpts_array = [{"id"=>"1", "excerpt"=>"sldkjflaskdjfaksldjfaklsdfjasdf", "person"=>"Ella Baker"}]
 
  end
    
    
  def array_of_term_records
    terms_array = DATABASE.execute("SELECT id, term, definition, phonetic FROM terms") # returns array of hashes, each has is a record
    
    delete_secondary_kvpairs(terms_array, :placeholder)
    
    return terms_array #==> terms_array = [{"id"=>"1", "term"=>"femme", "definition"=>"yoyo", "phonetic"=>"hexadecimal unicode baby"}]
 
  end
  
  
  def array_of_person_records
    persons_array = DATABASE.execute("SELECT id, person, bio, state, country, image, caption, source FROM persons") # returns array of hashes, each has is a record
    
    delete_secondary_kvpairs(persons_array, :placeholder)
    
    return persons_array  #==> persons_array = [{"id"=>"1", "person"=>"Ella Baker", "bio"=>"amazing woman", "state"=>"texarkana", "country"=>"us",                                                                            "image"=>"http://whatever.jpg", "caption"=>"he took it", "source"=>"<a href="http://whatever.com">Whatever</a>"}]
 
  end

    
    
  def get_array_items_for_keyword(options)
    keyword_text = options["keyword"].to_s
    
    keywords_array = DATABASE.execute("select keywords.keyword, item_id, items_tables.table_name FROM keywords_items JOIN keywords ON keywords_items.keyword_id = keywords.id JOIN items_tables ON keywords_items.item_table_id = items_tables.id")
    # ==> [{"keyword"=>"Beloved","item_id"=>1, "table_name"=>"excerpts", 0=>"Beloved", 1=>1, 2=>"excerpts"}, {"keyword"=>"United States", "item_id"=>1,"table_name"=>"excerpts", 0=>"United States", 1=>1, 2=>"excerpts"}]
    
    delete_secondary_kvpairs(keywords_array, :placeholder) # ==>keywords_array = [{"keyword"=>"Beloved","item_id"=>1, "table_name"=>"excerpts"}, {"keyword"=>"United States", "item_id"=>1,"table_name"=>"excerpts""}]
    
    keywords = []
    
    keywords_array.each do |hash|
      if hash["keyword"] == "#{keyword_text}"
        keywords.push({"id"=>"#{hash["item_id"].to_s}", "table_name"=>"#{hash["table_name"].to_s}"})
      end
    end     #==> [{"id"=>"1", "table_name"=>"excerpts"}, {"id"=>"2","table_name"=>"quotes"}]
  
    tagged_items = []
    
    keywords.each do |hash|
      table_name = "#{hash["table_name"].to_s}"
      item_id = "#{hash["id"]}"
      tagged_items.push(DATABASE.execute("SELECT * FROM #{table_name} WHERE id = #{item_id}"))
    end   
    
    tagged_items.flatten! 
    
    delete_secondary_kvpairs(tagged_items, :placeholder)
    
    
     #==> [{"id"=>1, "excerpt"=>"And if she thoutght that", "source"=>"Beloved", "person_id"=>9}, {"id"=>2,"excerpt"=>"I would give up                     the unessential.", "source"=>"The Awakening", "person_id"=>8}]
    
    tagged_items.each do |hash|
     
     if hash.keys[1] == "quote" || hash.keys[1] == "excerpt"
        name = DATABASE.execute("SELECT person FROM persons WHERE id = #{hash["person_id"].to_s}") 
        hash["person_id"] = name[0]["person"]      
      end
    end
    
    return tagged_items
        
  end
  
  
  
  
  
  # Public: #find_specifc_record_unformatted
  # Pulls a specific row or rows
  #
  # Parameters:
  # options - Hash
  #           - field - the field you want to search
  #           - table - the table you want to search     
  #           - value - The value you want to search                     
  #
  # Returns:
  # An array of hashes representing the records asked for
  # 
  # State changes:
  # None
    
  def find_specific_record_unformatted(options) # NOT FOR KEYWORD TABLES
    table = options["table"]
    field = options["field"]
    value = options["value"] 
    
    if value.is_a?(Array)
        value2 = value.join(" OR #{field} = ") # if looking for all records for specific keyword or user IP
        results = DATABASE.execute("SELECT * FROM #{table} WHERE  #{field} = #{value2}")
        
    else
      if value.is_a?(Integer)
        results = DATABASE.execute("SELECT * FROM #{table} WHERE  #{field} = #{value}")
      else
        results = DATABASE.execute("SELECT * FROM #{table} WHERE  #{field} = '#{value}'")
      end
    end
        
    return results
  end
  
  
  
  
  # Public: #find_specific_value
  # Returns a specific value for a given field and table
  #
  # Parameters:
  # options - Hash
  #           - field_known   - the field you want to search
  #           - field_unknown - the field you want the value for
  #           - table         - the table you want to search     
  #           - value         - The value you want to search                
  #       
  #
  # Returns:
  # A specific value
  #
  # State changes:
  # Sets @temp_unknown_value
  
  def find_specific_value(options)       # Could use to find author id for specific quote, then all quotes                                      from that author
    table = options["table"]
    field_known = options["field_known"]
    field_unknown = options["field_unknown"]
    value = options["value"]  
    
    if value.is_a?(Integer)
      array = DATABASE.execute("SELECT #{field_unknown} FROM #{table} WHERE #{field_known} = #{value}")
      
    else 
      array = DATABASE.execute("SELECT #{field_unknown} FROM #{table} WHERE #{field_known} = '#{value}'")
    
    end
      
    if array == []
      return "Sorry, no #{field_unknown} matched your search."
    else
      delete_secondary_kvpairs(array, :placeholder)
      field_unknown_hash = array[0]

      field_unknown_hash.each do |x, y|
        @temp_unknown_value = y
      end

      return @temp_unknown_value
    end
    
  end
  
    
  # Public: #delete_secondary_kvpairs
  # Gets rid of the safeguard key-value pairs that SQLite auto includes where the key is an integer 
  #
  # Parameters:
  # array_name  - Name of array on which method is being run
  # placeholder - Placeholder text for loop             
  #
  # Returns:
  # The updated array (minus gratuitous key-value pairs)
  
  
  def delete_secondary_kvpairs(array_name, placeholder)    
    array_name.each do |placeholder|
      placeholder.delete_if do |key, value|
        key.is_a?(Integer)
      end
    end
    
    return array_name
    
  end
  

  # Public: #delete_record
  # Deletes record (row) from specific table given specificed id number. We're making them enter id number so that they don't accidentally run it with value stored in @record_id
  #
  # Parameters:
  # options - hash
  #           - table: table where record resides   
  #           - record_id: id number for specific record
  #
  # Returns:
  # Empty array
  
  def delete_record(options)
    table = options["table"]
    record_id = options["record_id"] 
    
    DATABASE.execute("DELETE FROM #{table} WHERE id = #{record_id}")
  end
  
  # Public: #exterminate
  # Permanently deletes a table
  #
  # Parameters:
  # table - name of table to be deleted
  #             
  # Returns:
  # Nil
  
  def exterminate(table)
    DATABASE.execute("DROP TABLE #{table}") 
  end
end
