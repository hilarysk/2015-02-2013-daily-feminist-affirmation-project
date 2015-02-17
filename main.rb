require "pry"
require "sqlite3"

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





binding.pry