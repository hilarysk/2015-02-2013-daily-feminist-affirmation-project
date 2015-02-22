require "pry"
require "sqlite3"
require "sinatra"

require_relative "models/class-module.rb"
require_relative "models/instance-module.rb"

require_relative "database/database_setup.rb"
require_relative "models/keyworditem_class.rb"
require_relative "models/itemtable_class.rb"

require_relative "models/excerpt_class.rb"
require_relative "models/person_class.rb"
require_relative "models/quote_class.rb"
require_relative "models/term_class.rb"
require_relative "models/keyword_class.rb"




###############################
# The class method "find_specific_record" is formatted for people who want to see a list of all things by a specific author, or all their likes, or all items association with a certain keyword, etc. 
#
# The "find_specific_record_unformatted" is that, but unformatted, and meant for use as the highlighted item on the main page so that can play around with it a lot more. ?
#
##############################




get "/yay" do
  quotes = Quote.array_of_quote_records
  terms = Term.array_of_term_records
  excerpts = Excerpt.array_of_excerpt_records
  persons = Person.array_of_person_records

  items = quotes + terms + excerpts + persons
  
  item = items.sample


  if item.keys[1] == "quote"
    
    @quote = item["quote"]
    @person = item["person"]
    item_id = item["id"]

    @keywords = KeywordItem.get_array_keywords_for_item({"table"=>"quotes", "id_of_item"=>"#{item_id.to_s}"})  # ==> [{"keyword"=>"Beloved","item_id"=>1,                                                                                                                                   "table_name"=>"excerpts"}, {"keyword"=>"United States",                                                                                                              "item_id"=>1,"table_name"=>"excerpts"}]
    erb :quote

  elsif item.keys[1] == "excerpt"
   
    @excerpt = item["excerpt"]
    @source = item["source"]
    item_id = item["id"]
    @person = item["person"]

    @keywords = KeywordItem.get_array_keywords_for_item({"table"=>"excerpts", "id_of_item"=>"#{item_id.to_s}"})  
    
    erb :excerpt

  elsif item.keys[1] == "person"
    
    @name = item["person"]
    
    if item["state"] == ""
      @state = ""
    else
      @state = "#{item["state"]}, "
    end
    
    @country = item["country"]
    @bio = item["bio"]
    @image = item["image"]
    @caption = item["caption"]
    @source = item["source"]
    item_id = item["id"]

    @keywords = KeywordItem.get_array_keywords_for_item({"table"=>"persons", "id_of_item"=>"#{item_id.to_s}"})
    
    erb :person

  elsif item.keys[1] == "term"
    
    @term = item["term"]
    @definition = item["definition"]
    @phonetic = item["phonetic"]
    item_id = item["id"]
    
    @keywords = KeywordItem.get_array_keywords_for_item({"table"=>"terms", "id_of_item"=>"#{item_id.to_s}"})
    
    erb :term
    
  end
end



get "/keyword" do
  @keyword = params["keyword"]
  @results = KeywordItem.get_array_items_for_keyword({"keyword"=>"#{@keyword.to_s}"})
  
  erb :keyword
end

get "/about" do
  erb :about
end

get "/search" do
  erb :search
end




get "/temp" do
  @array = [{"person"=>"3"}, {"quote"=>"4"}, {"blue"=>"6"}, {"red"=>"7"}, {"pink"=>"10"}]

  erb :temp
end

#
binding.pry