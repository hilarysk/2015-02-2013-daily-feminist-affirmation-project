DATABASE = SQLite3::Database.new("/Users/hilarysk/Code/2015-02-13-daily-feminist-affirmation-project/database/feminist_affirmation.db")

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS excerpts (id INTEGER PRIMARY KEY, text TEXT, source TEXT, person_id INTEGER, FOREIGN KEY(person_id) REFERENCES persons(id))")

DATABASE.execute("CREATE TABLE IF NOT EXISTS persons (id INTEGER PRIMARY KEY, name TEXT, bio TEXT, state TEXT, country TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS quotes (id INTEGER PRIMARY KEY, text TEXT, person_id INTEGER, FOREIGN KEY(person_id) REFERENCES persons(id))")

DATABASE.execute("CREATE TABLE IF NOT EXISTS keywords (id INTEGER PRIMARY KEY, keyword TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS terms (id INTEGER PRIMARY KEY, term TEXT, definition TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS likes (id INTEGER PRIMARY KEY, user_ip TEXT, item_id INTEGER, item_type TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS matches (id INTEGER PRIMARY KEY, keyword_id INTEGER, item_id INTEGER, item_type TEXT)")

                                            
