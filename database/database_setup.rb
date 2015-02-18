DATABASE = SQLite3::Database.new("/Users/hilarysk/Code/2015-02-13-daily-feminist-affirmation-project/database/feminist_affirmation.db")

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS excerpts (id INTEGER PRIMARY KEY, text TEXT, source TEXT, person_id INTEGER, FOREIGN KEY(person_id) REFERENCES persons(id))")

DATABASE.execute("CREATE TABLE IF NOT EXISTS persons (id INTEGER PRIMARY KEY, name TEXT, bio TEXT, state TEXT, country TEXT, image TEXT, caption TEXT, source TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS quotes (id INTEGER PRIMARY KEY, text TEXT, person_id INTEGER, FOREIGN KEY(person_id) REFERENCES persons(id))")

DATABASE.execute("CREATE TABLE IF NOT EXISTS keywords (id INTEGER PRIMARY KEY, keyword TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS terms (id INTEGER PRIMARY KEY, term TEXT, definition TEXT, phonetic TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS likes (id INTEGER PRIMARY KEY, user_ip TEXT, item_id INTEGER, item_type TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS matches (id INTEGER PRIMARY KEY, keyword_id INTEGER, item_id INTEGER, item_type TEXT)")

# quotes:
#
# a = Quote.new("text"=>"“The stuggle is eternal. The tribe increase. Somebody else carries on.", "person_id"=>"1", )
# a = Quote.new("text"=>"I think people are well aware that they have a right to come forward [about sexual harassment]. But many people have a fear that the processes will not give them a fair hearing. Even for those who complain, I think we’ve fallen down in terms of the investigative process. We still have a lot of challenges in terms of making sure that the people who are found guilty of harassment suffer the consequences of their behavior.", "person_id"=>"3", )
# b = Quote.new("text"=>"My underlying goal was always to empower women. Get them to learn their rights, and to exercise them!", "person_id"=>"5", )
# c = Quote.new("text"=>"", "person_id"=>"", )
# d = Quote.new("text"=>"", "person_id"=>"", )
# e = Quote.new("text"=>"", "person_id"=>"", )
#
# keywords:
#
# a = Keyword.new("keyword"=>"Ella Baker")
# b = Keyword.new("keyword"=>"Ida B. Wells")
# c = Keyword.new("keyword"=>"Barbara Mikulski")
# d = Keyword.new("keyword"=>"Anita Hill")
# e = Keyword.new("keyword"=>"Mildred Jeffrey")
# f = Keyword.new("keyword"=>"Toni Morrison")
# g = Keyword.new("keyword"=>"")
# h = Keyword.new("keyword"=>"")
# i = Keyword.new("keyword"=>"")
# j = Keyword.new("keyword"=>"")
# k = Keyword.new("keyword"=>"")
# l = Keyword.new("keyword"=>"")
# m = Keyword.new("keyword"=>"")
# n = Keyword.new("keyword"=>"")
# o = Keyword.new("keyword"=>"")
# p = Keyword.new("keyword"=>"")
# q = Keyword.new("keyword"=>"")
# r = Keyword.new("keyword"=>"")
# s = Keyword.new("keyword"=>"")
# t = Keyword.new("keyword"=>"")
# u = Keyword.new("keyword"=>"")
# v = Keyword.new("keyword"=>"person")
# w = Keyword.new("keyword"=>"excerpt")
# x = Keyword.new("keyword"=>"quote")
# y = Keyword.new("keyword"=>"term")
# z = Keyword.new("keyword"=>"Kimberlé Crenshaw")
# aa = Keyword.new("keyword"=>"history")
# bb = Keyword.new("keyword"=>"magazine")
# cc = Keyword.new("keyword"=>"author")
# dd = Keyword.new("keyword"=>"civil rights")
# ee = Keyword.new("keyword"=>"politics")
# ff = Keyword.new("keyword"=>"LGBTQ")
# gg = Keyword.new("keyword"=>"labor")
# hh = Keyword.new("keyword"=>"United States")
# ii  = Keyword.new("keyword"=>"people of color")
#
# terms:
#
# a = Term.new("term"=>"", "definition"=>"", "phonetic"=>"")
# b = Term.new("term"=>"", "definition"=>"", "phonetic"=>"")
# c = Term.new("term"=>"", "definition"=>"", "phonetic"=>"")
# d = Term.new("term"=>"", "definition"=>"", "phonetic"=>"")
# e = Term.new("term"=>"", "definition"=>"", "phonetic"=>"")
#
# excerpts:
#
# a = Excerpt.new("text"=>"", "source"=>"", "person_id"=>"")
# b = Excerpt.new("text"=>"", "source"=>"", "person_id"=>"")
# c = Excerpt.new("text"=>"", "source"=>"", "person_id"=>"")
# d = Excerpt.new("text"=>"", "source"=>"", "person_id"=>"")
# e = Excerpt.new("text"=>"", "source"=>"", "person_id"=>"")
#
# persons:
#
# a = Person.new("name"=>"Ella Baker", "bio"=>"Ella Jo Baker was born on Dec. 13, 1903, in Norfolk, Virginia, though she grew up in North Carolina. The pride and resilience of her grandmother, a former slave, in the face of racism and injustice, inspired Ms. Baker throughout her life. She studied at Shaw University in Raleigh, North Carolina, starting at age 15. After graduating as valedictorian, she moved to New York City and joined joined the Young Negroes Cooperative League, whose purpose was to develop black economic power through collective planning. She also involved herself with several women's organizations. Ms. Baker worked for the NAACP from 1940 to 1946, and helped organize Martin Luther King's then-new organization, the Southern Christian Leadership Conference (SCLC). She left SCLC after the first lunch counter sit-in protest in April 1960 to help found the Student Nonviolent Coordinating Committee, or SNCC. In 1964, SNCC helped create Freedom Summer, an effort to focus national attention on Mississippi's racism and to register black voters. With Ella Baker's guidance and encouragement, SNCC became one of the foremost advocates for human rights in the country. Ella Baker once said, \"This may only be a dream of mine, but I think it can be made real.\"", "state"=>"Virginia", "country"=>"United States", "image"=>"http://ellabakercenter.org/sites/default/files/site/media/ella3.gif", "caption"=>"Courtesy of the Ella Baker Center for Human Rights", "source"=>"<a href='http://ellabakercenter.org/about/who-was-ella-baker'>The Ella Baker Center for Human Rights</a>")
# b = Person.new("name"=>"Barbara Mikulski", "bio"=>"Born in 1936, Barbara Mikulski grew up in East Baltimore as the daughter of a grocer. She graduated from Mount St. Agnes College in 1958 and earned a master's degree in social work from the University of Maryland in 1965. In 1976, she won a seat in the U.S. House of Representatives. In 1986, Mikulski became the first female Democrat to win election to the Senate. She is currently the longest-serving woman senator. While in House, she served on the Merchant Marine & Fisheries Committee and Energy & Commerce Committee. Mikulski also advocated for legislation to protect children and supported the Equal Rights Amendment. Over the years, Mikulski has been a champion for her state and for many other issues close to her heart. She has worked on behalf of women's issues, including legislation to get breast and cervical cancer screenings and treatment for the uninsured. After winning her reelection bid in 2011, Mikulski is doing her best to bring more women into the Senate.", "state"=>"Maryland", "country"=>"United States", "image"=>"http://bioguide.congress.gov/bioguide/photo/m/m000702.jpg", "caption"=>"Photo via Congress.gov", "source"=>"<a href='http://www.biography.com/people/barbara-mikulski-20771233#political-career'>Biography.com</a>")
# c = Person.new("name"=>"Anita Hill", "bio"=>"In the fall of 1991, a young law professor found herself at the center of a media storm of almost unprecedented proportions. Burdened with information that could determine the future of a Supreme Court nomination, Professor Hill's experience changed the way we view sexual harassment, gender, and the judicial confirmation process. A teacher, speaker, researcher and writer, Anita Hill has earned international prominence as an authority on race and gender issues, especially as they affect the workplace. Hill received her law degree from Yale University, and, after a stint at the Equal Employment Opportunity Commission (EEOC), she began teaching law at the University of Oklahoma. In 1991, Hill testified that Supreme Court nominee Clarence Thomas had made unwelcome sexual advances while he was her supervisor at the EEOC in the 1980s. Although Thomas's appointment was subsequently confirmed, Hill's testimony brought the issue of sexual harassment to public attention, forever changing relations between men and women in the workplace. In 1997, Hill published <em>Speaking Truth to Power</em>, a personal memoir and study of her involvement in the Thomas hearings. A documentary about this time, <em>Anita</em>, was released in 2013.", "state"=>"Oklahoma", "country"=>"United States", "image"=>"https://c1.staticflickr.com/3/2943/15343133981_d983bf8cb0_h.jpg", "caption"=>"Photo by <a href='https://www.flickr.com/photos/qwrrty/15343133981/'>Tim Pierce</a>", "source"=>"<a href='http://www.allamericanspeakers.com/speakers/Anita-Hill/722'>All American Speakers</a>")
# d = Person.new("name"=>"Ida B. Wells", "bio"=>"The oldest of eight children, Ida B. Wells was born in Holly Springs, Mississippi. Wells attended Rust College and then became a teacher in Memphis, Tennessee. Shortly after she arrived, Wells was involved in an altercation with a white conductor while riding the railroad. She had purchased a first-class ticket, and was seated in the ladies car when the conductor ordered her to sit in the Jim Crow (i.e. black) section, which did not offer first-class accommodations. She refused and when the conductor tried to remove her, she 'fastened her teeth on the back of his hand.' Wells was ejected from the train, and she sued. She won her case in a lower court, but the decision was reversed in an appeals court. While living in Memphis, Wells became a co-owner and editor of a local black newspaper called THE FREE SPEECH AND HEADLIGHT. She condemned violence against blacks, disfranchisement, poor schools, and the failure of black people to fight for their rights. She was fired from her teaching job and became a full-time journalist. When Wells was out of town, her newspaper was destroyed by a mob and she was warned not to return to Memphis because her life was in danger. Wells took her anti-lynching campaign to England and was well received. In 1895 she married Ferdinand Barnett, a prominent Chicago attorney. The following year she helped organize the National Association of Colored Women. In 1909, she helped found the National Association for the Advancement of Colored People. Wells-Barnett continued her fight for black civil and political rights and an end to lynching until shortly before she died. ", "state"=>"Mississippi", "country"=>"United States", "image"=>"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Mary_Garrity_-_Ida_B._Wells-Barnett_-_Google_Art_Project_-_restoration_crop.jpg/840px-Mary_Garrity_-_Ida_B._Wells-Barnett_-_Google_Art_Project_-_restoration_crop.jpg", "caption"=>"Photo: public domain", "source"=>"<a href='http://www.pbs.org/wnet/jimcrow/stories_people_wells.html'>PBS</a>")
# e = Person.new("name"=>"Mildred Jeffrey", "bio"=>"Mildred Jeffrey was an influential behind-the-scenes combatant in the women's, labor and civil rights movements for seven decades. She was born on Dec. 29, 1910, in Alton, Iowa, the eldest of seven children. Her grandmother, a widow, ran a farm and raised 16 children by herself. Her mother, who was the first woman to become a registered pharmacist in Iowa, in 1908, raised seven children on her own after her husband left the family. As a student at the University of Minnesota in the early 1930's, [Jeffrey] and an African-American classmate helped integrate restaurants in Minneapolis. Decades later, she marched in the South with the Rev. Dr. Martin Luther King Jr. She was also a founder of the National Women's Political Caucus in 1971. In 2000, President Bill Clinton awarded her the Presidential Medal of Freedom, the nation's highest civilian honor.", "state"=>"Iowa", "country"=>"United States", "image"=>"http://www.uaw.org/sites/default/files/women_jeffrey_page.jpg", "caption"=>"Photo via the United Auto Workers", "source"=>"<a href='http://www.nytimes.com/2004/04/05/us/mildred-jeffrey-93-activist-for-women-labor-and-liberties.html'>New York Times</a>")
# f = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")  5. Alberta Williams King -- mother of MLK Jr., was assassinated in her church
# g = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")  6. Fannie Lou Hamer -- civil rights and voting organizer
# h = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")  9. Kirsten Gillibrand -- leading reforms in the Senate for campus and military sexual assault. Her new project "Off the Sidelines" encourages women to get involved in politics.
# i = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")  10. Alma Adams -- 100th woman to serve in Congress
# j = Person.new("name"=>"Toni Morrison", "bio"=>"Born Chloe Anthony Wofford, in 1931 in Lorain (Ohio), the second of four children in a black working-class family. Displayed an early interest in literature. Studied humanities at Howard and Cornell Universities, followed by an academic career at Texas Southern University, Howard University, Yale, and since 1989, a chair at Princeton University. She has also worked as an editor for Random House, a critic, and given numerous public lectures, specializing in African-American literature. She made her debut as a novelist in 1970, soon gaining the attention of both critics and a wider audience for her epic power, unerring ear for dialogue, and her poetically-charged and richly-expressive depictions of Black America. A member since 1981 of the American Academy of Arts and Letters, she has been awarded a number of literary distinctions, among them the Pulitzer Prize in 1988.", "state"=>"Ohio", "country"=>"United States", "image"=>"http://upload.wikimedia.org/wikipedia/commons/0/04/Toni_Morrison_2008-2.jpg", "caption"=>"Angela Radulescu / CC-BY-SA-3.0", "source"=>"From Nobel Lectures, Literature 1991-1995, Editor Sture Allén, World Scientific Publishing Co., Singapore, 1997")
# k = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")
# l = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")
# m = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")
# n = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")
# o = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")
# p = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")
# q = Person.new("name"=>"", "bio"=>"", "state"=>"", "country"=>"", "image"=>"", "caption"=>"", "source"=>"")
#
# matches:
#
# a = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# b = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# c = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# d = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# e = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# f = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# g = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# h = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# i = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# j = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# k = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# l = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# m = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# n = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# o = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# p = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# q = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# r = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# s = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# t = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# u = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# v = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# w = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# x = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# y = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# z = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# aa = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# bb = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# cc = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# dd = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# ee = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# ff = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# gg = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# hh = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# ii = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# jj = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# kk = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# ll = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# mm = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# nn = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# oo = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# pp = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# qq = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# rr = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# ss = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# tt = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# uu = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# vv = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# ww = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# xx = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# yy = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")
# zz = Match.new("keyword_id"=>"", "item_id"=>"", "item_type"=>"")