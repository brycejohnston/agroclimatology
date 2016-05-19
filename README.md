# Agroclimatology
[![Gem Version](https://badge.fury.io/rb/agroclimatology.svg)](https://badge.fury.io/rb/agroclimatology)
[![Build Status](https://travis-ci.org/brycejohnston/agroclimatology.svg?branch=master)](https://travis-ci.org/brycejohnston/agroclimatology)

Ruby client for interacting with the [NASA (POWER) Agroclimatology Web Resource](http://power.larc.nasa.gov/cgi-bin/agro.cgi)

Initial functionality is focused on getting solar radiation data
for a given latitude and longitude. Other solar radiation and meteorological query parameters will be available in subsequent versions.

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

Required params
- latitude
- longitude

Optional params
- year_start (default: 1983)
- year_end (default: current year)

```ruby
Agroclimatology.fetch(latitude, longitude, year_start, year_end)
```

### Examples

Fetch all solar radiation data available for Manhattan, KS, United States (1983 - Current Year)
```ruby
Agroclimatology.fetch(39.1836111, -96.5713889)
```

Fetch solar radiation data for Woombye, QLD, Australia from 2015 - 2016
```ruby
Agroclimatology.fetch(-26.660446, 152.964647, 2015, 2016)
```

### Output

Returns JSON output containing records for every day included in year_start - year_end range
- **year**                - Year
- **day**                 - Day of Year
- **rad_atmosphere** - Average Top-of-atmosphere Insolation (MJ/m^2/day)
- **rad_surface** - Average Insolation Incident On A Horizontal Surface (MJ/m^2/day)  
- **rad_flux** - Average Downward Longwave Radiative Flux (MJ/m^2/day)  

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brycejohnston/agroclimatology.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
