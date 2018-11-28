1. Setup environment

2. Make two models and Setup associations
	User (has_many urls)
	urls (belongs_to user)

3. '/' create form for shortening url 
	It's not necessay for a url to belong to a user
	Post to '/urls' and display new url on '/' using rack flash

take a link from user
http://www.google.com

make an instance of a Url class and create shorten method on it
google = Url.create(url: "http://google.com")

google.shorten
=> http://localhost/ax2dgf(id converted to base 32)

Redirection to real url from shorten

User visit shorten url then redirect to actual url
route '/:(base-32-id)'
find by base-32-d
redirect to real url


4. Users signup - login

Logged in users will have the feature to view links created by them

Signup users
Login users
