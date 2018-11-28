1. Setup environment

2. Make two models and Setup associations
	User (has_many shorten_urls)
	urls (belongs_to user)

3. '/' create form for shortening url 
	It's not necessay for a url to belong to a user
	Post to '/urls' and display new url on '/' using rack flash



take a link from user
http://www.google.com

make an instance of a Url class and create shorten method on it
google = Url.create(url: "http://google.com")

google.shorten
=> http://localhost/ax2dgf(id converted to base 64)

Redirection to real url from shorten

User visit shorten url then redirect to actual url
route '/:(base-32)'
find by base-32
redirect to real url