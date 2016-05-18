# Agroclimatology

Ruby client for interacting with the [NASA (POWER) Agroclimatology Web Resource](http://power.larc.nasa.gov/cgi-bin/agro.cgi)

Initial functionality is focused on getting solar radiation datasets (insolation on horizontal surface)
for a given latitude and longitude. Other solar radiation and meteorological datasets will be accessible in subsequent versions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'agroclimatology'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install agroclimatology

## Usage

Get all historical data available
```ruby
Agroclimatology.fetch(39.1836111, -96.5713889)
```

Specify a date range
```ruby
Agroclimatology.fetch(39.1836111, -96.5713889, 2010, 2016)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bjohnston/agroclimatology.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
