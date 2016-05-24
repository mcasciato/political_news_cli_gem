# Political News CLI Gem!

Welcome to my political news gem!  

It's hard not to get wrapped up in politics given that we're in an election cycle. I wanted a way to get through all the clutter and verbal attacking that you'd find on TV, and just simply read what is going on.

This gem will scrape some popular websites (New York Times, Washington Post, and Buzzfeed News) and return the most recent article about politics. You can then select an article for some more information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'political_news'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install political_news

## Usage

After installing the gem, it's pretty easy to interact with it. Once you run the program, it will give you a list of the most recent articles (1, 2, etc.) with their source, article title, and article author.

The CLI will prompt you to enter a number for more information, type 'list' to refresh the list of articles, or type 'exit' to exit the program. Pretty simple!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mcasciato/political_news_cli_gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
