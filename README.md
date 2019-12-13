# RSS Reader Made in Sinatra

## Description

This is a URL Shortener application 

What is a URL Shortener?

URL shortening is a technique on the World Wide Web in which a Uniform Resource Locator (URL) may be made substantially shorter and still direct to the required page. This is achieved by using a redirect which links to the web page that has a long URL.

[Watch this video to understand how this app works!](https://youtu.be/qaRWd4NzCPQ)

[Blog Post about this app](https://aurangzaib-danial.github.io/url_shortener_made_in_sinatra)

## Built With

* [Ruby 2.6.3](https://www.ruby-lang.org/en/news/2019/04/17/ruby-2-6-3-released/)
* [Sinatra](http://sinatrarb.com/) and [ActiveRecord](https://apidock.com/rails/ActiveRecord/Base) - The Ruby frameworks used
* [PostgreSQL](https://www.postgresql.org/) - The relational database used for production
* [SQLITE3](https://www.sqlite.org/) - The relational database used for development
* HTML5 & CSS

## Usage

This app is hosted on Heroku https://su-s.herokuapp.com/ using heroku free plan.

**App might take time to load sometimes. The reason is that heroku puts apps which are on free plan to sleep after 30 minutes of inactivity. So when you visit the website, the app is waked from sleep which takes a little time!**

## Development

Try this app in your local environment, clone and run following command inside this project's directory

    $ bundle && bundle exec rake db:schema:load

Start up local server

    $ bundle exec shotgun 

For interactive console

    $ bundle exec rake console

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aurangzaib-danial/sinatra-url-shortener. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://contributor-covenant.org/) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SinatraRSSReader project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct).
