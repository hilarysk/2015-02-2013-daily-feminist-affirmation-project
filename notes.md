### Facebook share button:
This: <a href="https://www.facebook.com/sharer/sharer.php?u=example.org" target="_blank">
  (Share button goes here) </a>
  
Or maybe this? <iframe src="//www.facebook.com/plugins/share_button.php?href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;layout=button_count&amp;appId=275052925858908" scrolling="no" frameborder="0" style="border:none; overflow:hidden;" allowTransparency="true"></iframe>

From here: https://developers.facebook.com/docs/plugins/share-button
  
### Where to get info for database:
* Crowd-source Facebook, twitter, GRBD
* Make list of own favorites
* Internet?

______________________________________________________________________________

#*"Should" cases*

* The page should return a random excerpt with each refresh/click of an "Again!" button or something
* The user should be able to share a specific excerpt displayed to social media
* Click author tag to see all excerpts from specific author, information about specific author
* Click book tag to see all excerpts from specific book
* Click category tags to see all excerpts tagged that category
* Let user download the results of a search as jpg or or pdf through use of external gem (IMGKIT? Wicked?) and maybe auto-delete after 30 minutes or something? (Not sure on functional capabilities of either gem yet)

#*"Should not" cases*

* Have authors, excerpts or keywords listed more than once
* Repeat excerpt until has gone through entire list
* Create JPG/PDF to download until user specifically requests one
* Be able to create author without all additional information; same for excerpts
* Be able to assign a value to the author_id field in the excerpts table unless that ID already exists as a primary key in the authors table

#*Extensions*

* ~~Branch out from book excerpts to quotes from famous feminists (add class/table "quotes", change "author" to "contributor" or somesuch) and/or definitions (add class/table "glossary")~~
* Let user log-in with password and be able to edit database (add excerpts, authors, etc.)




