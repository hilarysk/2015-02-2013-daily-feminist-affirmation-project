# require "pry"
require "sqlite3"
require "sinatra"

require_relative "models/class-module.rb"
require_relative "models/instance-module.rb"

require_relative "database/database_setup.rb"
require_relative "models/excerpt_class.rb"
require_relative "models/keyword_class.rb"
require_relative "models/like_class.rb"
require_relative "models/match_class.rb"
require_relative "models/person_class.rb"
require_relative "models/quote_class.rb"
require_relative "models/term_class.rb"




###############################
# The class method "find_specific_record" is formatted for people who want to see a list of all things by a specific author, or all their likes, or all items association with a certain keyword, etc. 
#
# The "find_specific_record_unformatted" is that, but unformatted, and meant for use as the highlighted item on the main page so that can play around with it a lot more. ?
#
##############################


  

# get "/homepage" do
#   item = array_of_items.run some kind of .rand
#   if item is from table excerpts
#     erb :excerpt
#   elsif item is from table quotes
#     erb :quote
#   elsif etc.
#   end
#
#   erb :homepage
# end

get "/person" do #from clicking on person's name. Iterate through and find all examples where person is linked to something
  @person_name = params["person_name"]
  erb :person
end

get "/source" do #from clicking on source. Iterate through and find all examples where something comes from source
  @source = params["source"]
  erb :source
end

get "/person_example" do
  @person_image = "http://upload.wikimedia.org/wikipedia/commons/0/04/Toni_Morrison_2008-2.jpg"
  @person_name = "Toni Morrison"
  @image_caption = "Angela Radulescu / CC-BY-SA-3.0"
  @person_text = "asdfjksdlfkjasdlfkjasd fkasdfkas jdflkasdjf lkasdfj alksdfj aslkdfj asldfkj asldkfjas dfasj dflkasdfj alskdfj aslkdfj aslkdfj asldkfj aslkdfj asldkfjas dfklasdj falksdjf alksdfj aslkdfj asldkf ajskdlf jasdlkf jasdklf asldkf asldkf aklsd f."
  
  keywords = ["black", "author", "United States"]
  @keyword1 = keywords[0]
  @keyword2 = keywords[1]
  @keyword3 = keywords[2]
  erb :person_example
end

get "/excerpt_example" do
  @excerpt_text = "And if she thought anything, it was No. No. Nono. Nonono. Simple. She just flew. Collected every bit of life she had made, all the parts of her that were precious and fine and beautiful, and carried, pushed, dragged them through the veil, out, away, over there where no one could hurt them. Over there. Outside this place, where they would be safe."
  @excerpt_source = "Beloved"
  @excerpt_person = "Toni Morrison"
  
  keywords = ["black", "author", "United States"]
  @keyword1 = keywords[0]
  @keyword2 = keywords[1]
  @keyword3 = keywords[2]
  erb :excerpt_example
end

get "/term_example" do
  @term = "intersectional feminism"
  @definition = "Coined by black legal scholar Kimberlé Crenshaw in 1989, 'intersectionality' refers to the intersections of different forms or systems of oppression. For modern feminism, it means bringing groups of women to the table who have often been marginalized by mainstream feminist movements, and by recognizing that the difficulties women of color face, or women with disabilities, or LGBTQ women, or poor women face can be very different than those faced by white, able-bodied, straight, middle-class women; and that their voices must no longer be silenced, and their struggles no longer ignored. Essentially, it's the idea that there is no 'one size fits all' feminism."
  @phonetic = "ˌɪntərˈsɛkʃən(ə)l ˈfɛmɪˌnɪzəm"
  
  keywords = ["term", "Kimberlé Crenshaw", "intersectional"]
  @keyword1 = keywords[0]
  @keyword2 = keywords[1]
  @keyword3 = keywords[2]
  erb :term_example
end

before "/keyword" do
  if "#{params["keyword"]}" == "term"
    redirect to ("/all_terms")
  end
end

get "/keyword" do
  @keyword = params["keyword"]
  erb :keyword
end

get "/all_terms" do
  #page with all the terms on it
  erb :all_terms
end

get "/about" do
  erb :about
end

get "/search" do
  erb :search
end


# binding.pry