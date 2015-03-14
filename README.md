# TwilioBot

Don't worry about writing a web server — integrate with Twilio using a plain Ruby class!

TwilioBot maps web server requests to Ruby methods, and provides a Ruby-like way to respond with TwiML.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twilio_bot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twilio_bot

## Usage

Write a Ruby class like this:

```ruby
require "twilio_bot"

class MyBot < TwilioBot
  account_sid "MY TWILIO ACCOUNT SID"
  auth_token "MY TWILIO AUTH TOKEN"

  def start
    twilio.say "hello world!", voice: :woman
    twilio.redirect :redirected
  end

  def redirected
    twilio.say "redirected!"
  end
end
```

Calling methods on `twilio` generate TwiML. See [Twilio's documentation](https://www.twilio.com/docs/api/twiml) for more information.

Then start the server like this:

```ruby
MyBot.run
```

`POST /start` to call `start` in your bot class.

`TwilioBot` is a subclass of `Sinatra::Base`, so you can use any normal Sinatra stuff with it.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/alyssais/twilio_bot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
