require "pry"
require "sqlite3"
# require "sinatra"

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


                  # get "/person_example" do
                  #   @person_image = "http://upload.wikimedia.org/wikipedia/commons/0/04/Toni_Morrison_2008-2.jpg"
                  #   @image_caption = "Angela Radulescu / CC-BY-SA-3.0"
                  #   @person_text = "<strong>Toni Morrison</strong><br><br>Ohio, United States<br><br>Born Chloe Anthony Wofford, in 1931 in Lorain (Ohio), the second of four children in a black working-class family. Displayed an early interest in literature. Studied humanities at Howard and Cornell Universities, followed by an academic career at Texas Southern University, Howard University, Yale, and since 1989, a chair at Princeton University. She has also worked as an editor for Random House, a critic, and given numerous public lectures, specializing in African-American literature. She made her debut as a novelist in 1970, soon gaining the attention of both critics and a wider audience for her epic power, unerring ear for dialogue, and her poetically-charged and richly-expressive depictions of Black America. A member since 1981 of the American Academy of Arts and Letters, she has been awarded a number of literary distinctions, among them the Pulitzer Prize in 1988.<br><br><em>Text: Nobel Lectures, Literature 1991-1995, Editor Sture Allén, World Scientific Publishing Co., Singapore, 1997</em>"
                  #
                  #   @keywords = ["people of color", "literature", "United States", "Toni Morrison", "person"]
                  #
                  #   erb :person_example
                  # end
                  #
                  # get "/excerpt_example" do
                  #   @excerpt_text = "And if she thought anything, it was No. No. Nono. Nonono. Simple. She just flew. Collected every bit of life she had made, all the parts of her that were precious and fine and beautiful, and carried, pushed, dragged them through the veil, out, away, over there where no one could hurt them. Over there. Outside this place, where they would be safe."
                  #   @excerpt_source = "Beloved"
                  #   @excerpt_person = "Toni Morrison"
                  #
                  #   @keywords = ["black", "author", "Beloved", "United States", "Toni Morrison", "excerpt"]
                  #
                  #   erb :excerpt_example
                  # end
                  #
                  # get "/term_example" do
                  #   @term = "intersectional feminism"
                  #   @definition = "Coined by black legal scholar Kimberlé Crenshaw in 1989, 'intersectionality' refers to the intersections of different forms or systems of oppression. For modern feminism, it means bringing groups of women to the table who have often been marginalized by mainstream feminist movements, and by recognizing that the difficulties women of color face, or women with disabilities, or LGBTQ women, or poor women face can be very different than those faced by white, able-bodied, straight, middle-class women; and that their voices must no longer be silenced, and their struggles no longer ignored. Essentially, it's the idea that there is no 'one size fits all' feminism."
                  #   @phonetic = "ˌɪntərˈsɛkʃən(ə)l ˈfɛmɪˌnɪzəm"
                  #
                  #   @keywords = ["term", "Kimberlé Crenshaw", "people of color", "LGBTQ"]
                  #
                  #   erb :term_example
                  # end
                  #
                  # get "/keyword" do
                  #   @keyword = params["keyword"]
                  #   erb :keyword
                  # end
                  #
                  # get "/about" do
                  #   erb :about
                  # end
                  #
                  # get "/search" do
                  #   erb :search
                  # end
                  #
                  # get "/quote_example" do
                  #   @quote = "I always get asked, 'Where do you get your confidence?' I think people are well meaning, but it's pretty insulting. Because what it means to me is, 'You, Mindy Kaling, have all the trappings of a very marginalized person. You're not skinny, you're not white, you're a woman. Why on earth would you feel like you're worth anything?'"
                  #   @person = "Mindy Kaling"
                  #
                  #   @keywords = ["people of color", "quote", "comedian", "Mindy Kaling"]
                  #
                  #   erb :quote_example
                  # end


# get "/temp" do
#   @array = [{"person"=>"3"}, {"quote"=>"4"}, {"blue"=>"6"}, {"red"=>"7"}, {"pink"=>"10"}]
#
#   erb :temp
# end


binding.pry