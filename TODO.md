1. Setup environment

2. Make two models and Setup associations
	User (has_many shorten_urls)
	shorten_urls (belongs_to user)

3. '/' create form for shortening url 
	It's not necessay for a url to belong to a user
	Post to '/shorten_urls' and display new url on '/' using rack flash