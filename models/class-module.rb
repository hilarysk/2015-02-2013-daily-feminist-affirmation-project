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
    
  def find_specific_record_unformatted(options)
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
  
  # Public: #find_specific_record
  # Pulls a specific row or rows and formats it
  #
  # Parameters:
  # options - Hash    
  #           - field - the field you want to search
  #           - table - the table you want to search 
  #           - value - The value you want to search for
  #
  # Returns:
  # A formatted list of the record/s in an easy-to-read layout. 
  # 
  # State changes:
  # None
 
  ############################################################################################################ => 
    
  def format_find_specific_record(results, table)    # ----- format results from find_specific_record ^^ 
    
    formatted_results = []                            # ------ refactor turning each "if" action into separate method

    results.each do |hash|
      hash.delete_if do |key, value|
        key.is_a?(String)
      end
      
      hash.each do |key, value|
        if table == "terms"
          case
            when key == 1
              formatted_results << ("<strong>What is \"#{value.to_s}\"?</strong><br>") #term 
            when key == 2
              formatted_results << ("#{value.to_s}<br><br>") #definition
          end
          
        elsif table == "quotes"
          case
            when key == 1
              formatted_results << ("<strong>\"#{value.to_s}\"</strong><br>") #quote text
            when key == 2
              formatted_results << ("- #{value.to_s}<br><br>") #quote source
          end
          
        elsif table == "excerpts"
          case
            when key == 1
              formatted_results << ("\"#{value.to_s}\"<br>") #excerpt text
            when key == 2
              formatted_results << ("- <strong><em>#{value.to_s}</em></strong>, ") #excerpt source (song,
            when key == 3                                                          #book, magazine)
              person_name = Person.find_specific_value({"table"=>"persons", "field_known"=>"id", "value"=>"#{value.to_s}", "field_unknown"=>"name"})
              formatted_results << ("#{person_name.to_s}<br><br>") #excerpt writer
          end
            
        elsif table == "persons"     # finish this
          case
            when key == 1
              formatted_results << ("<strong>#{value.to_s}</strong><br>") #person name 
            when key == 3
              if value != nil
                formatted_results << ("Born: #{value.to_s}, ") #person state
              else
                formatted_results << ("Born: ")
              end
            when key == 4
              formatted_results << ("#{value.to_s}<br><br>") #person country
            when key == 2
              formatted_results << ("#{value.to_s}<br>") #person bio
            when key == 7
              formatted_results << ("<strong><em>Source: #{value.to_s}</strong></em><br>")
            when key == 5
              formatted_results << ("<img class='personimage' src='#{value.to_s}'>") # person image
            when key == 6
              formatted_results << ("<p class='imagecaption'>#{value.to_s}</p<") #person image caption
          end
                                    
        # elsif table == "keywords" # not really necessary?
        #   case
        #   end
                      
        elsif table == "likes"       
          case
            when key == 1
              @user_ip = "#{value.to_s}"
            when key == 3
              @item_table = "#{value.to_s}"
            when key == 2
              @item_id = "#{value.to_s}"
                            
              if @item_table == "excerpts"
                book_name = Excerpt.find_specific_value({"table"=>"excerpts", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"book"})
                book_author_id = Excerpt.find_specific_value({"table"=>"excerpts", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"person_id"})
                book_author = Person.find_specific_value({"table"=>"persons", "field_known"=>"id", "value"=>"#{book_author_id}", "field_unknown"=>"name"})
                excerpt_text = Excerpt.find_specific_value({"table"=>"excerpts", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"text"})
              
              
                formatted_results << ("#{@user_ip} liked the following excerpt from <em>#{book_name.to_s}</em> by #{@book_author.to_s}:<br>\"#{excerpt_text}\"<br><br>") 
             
              elsif @item_table == "persons"
                person_name = Person.find_specific_value({"table"=>"persons", "field_known"=>"#{@item_id}", "value"=>"#{value.to_s}", "field_unknown"=>"name"})
                
                formatted_results << ("#{@user_ip} liked an entry about #{person_name.to_s}<br><br>") 

              elsif @item_table == "quotes"
                quote_text = Quote.find_specific_value({"table"=>"quotes", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"text"})
                person_id = Quote.find_specific_value({"table"=>"quotes", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"person_id"})
                speaker = Person.find_specific_value({"table"=>"persons", "field_known"=>"id", "value"=>"#{person_id}", "field_unknown"=>"name"})
              
                formatted_results << ("#{@user_ip} liked the following quote from #{speaker.to_s}:<br>\"#{quote_text}\"<br><br>") 
              
              elsif @item_table == "terms"
                term = Term.find_specific_value({"table"=>"terms", "field_known"=>"#{@item_id}", "value"=>"#{value.to_s}", "field_unknown"=>"term"})
                definition = Term.find_specific_value({"table"=>"terms", "field_known"=>"#{@item_id}", "value"=>"#{value.to_s}", "field_unknown"=>"definition"})
              
                formatted_results << ("#{@user_ip} liked the following term:<br><strong>#{term.to_s}:</strong> #{definition.to_s}<br><br>") 
                  
              end
          end
              
        elsif table == "matches"     # finish this
          case
            when key == 1
              @keyword_id = "#{value.to_s}"
            when key == 3
              @item_table = "#{value.to_s}"
            when key == 2
              @item_id = "#{value.to_s}"
                            
              if @item_table == "excerpts"
                keyword_text = Keyword.find_specific_value({"table"=>"keywords", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"keyword"})
              
                book_name = Excerpt.find_specific_value({"table"=>"excerpts", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"book"})
                book_author_id = Excerpt.find_specific_value({"table"=>"excerpts", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"person_id"})
                book_author = Person.find_specific_value({"table"=>"persons", "field_known"=>"id", "value"=>"#{book_author_id}", "field_unknown"=>"name"})
                excerpt_text = Excerpt.find_specific_value({"table"=>"excerpts", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"text"})
              
              
                formatted_results << ("<strong>TAGGED #{keyword_text.to_s.upcase}:</strong><br<br>\"#{excerpt_text}\"<br><em>#{book_name.to_s}</em>, by #{@book_author.to_s}<br><br>") 
             
              elsif @item_table == "persons"
                person_name = Person.find_specific_value({"table"=>"persons", "field_known"=>"#{@item_id}", "value"=>"#{value.to_s}", "field_unknown"=>"name"})
                
                formatted_results << ("#{person_name.to_s}<br><br>") 

              elsif @item_table == "quotes"
                quote_text = Quote.find_specific_value({"table"=>"quotes", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"text"})
                person_id = Quote.find_specific_value({"table"=>"quotes", "field_known"=>"id", "value"=>"#{@item_id}", "field_unknown"=>"person_id"})
                speaker = Person.find_specific_value({"table"=>"persons", "field_known"=>"id", "value"=>"#{person_id}", "field_unknown"=>"name"})
              
                formatted_results << ("\"#{quote_text}\"<br><em>#{speaker.to_s}</em><br><br>") 
              
              elsif @item_table == "terms"
                term = Term.find_specific_value({"table"=>"terms", "field_known"=>"#{@item_id}", "value"=>"#{value.to_s}", "field_unknown"=>"term"})
                definition = Term.find_specific_value({"table"=>"terms", "field_known"=>"#{@item_id}", "value"=>"#{value.to_s}", "field_unknown"=>"definition"})
              
                formatted_results << ("<strong>#{term.to_s}:</strong> #{definition.to_s}<br><br>") 
                  
              end
              
            end
          end
        end
      
    end

    return formatted_results.join("")
    
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
