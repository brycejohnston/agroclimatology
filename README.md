# Agroclimatology

[![Gem Version](http://img.shields.io/gem/v/agroclimatology.svg)][gem]
[![Build Status](http://img.shields.io/travis/brycejohnston/agroclimatology.svg)][travis]

[gem]: https://rubygems.org/gems/agroclimatology
[travis]: http://travis-ci.org/brycejohnston/agroclimatology

Ruby client for interacting with the [NASA (POWER) Agroclimatology Web Resource](http://power.larc.nasa.gov/cgi-bin/agro.cgi)

Initial functionality is focused on getting solar radiation data
for a given latitude and longitude. Other solar radiation and meteorological
query parameters will be available in subsequent versions.

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

Fetch all solar radiation data available for Dodge City, KS, United States
```ruby
Agroclimatology.fetch(37.752798, -100.017079)
```

Fetch solar radiation data for Woombye, QLD, Australia from 2015 - 2016
```ruby
Agroclimatology.fetch(-26.660446, 152.964647, 2015, 2016)
```

```ruby
[
  {
    :year => "2015",
    :day_of_year => "1",
    :rad_atmosphere => "42.84",
    :rad_surface => "27.47",
    :rad_flux => "34.78"
  },
  {
    :year => "2015",
    :day_of_year => "2",
    :rad_atmosphere => "43.27",
    :rad_surface => "23.00",
    :rad_flux => "34.81"
  },
]
```

### Output

Ruby object containing array of hashes for every day included in year_start - year_end range
- **year**                - Year
- **day_of_year**         - Day of Year
- **rad_atmosphere** - Average Top-of-atmosphere Insolation (MJ/m^2/day)
- **rad_surface** - Average Insolation Incident On A Horizontal Surface (MJ/m^2/day)  
- **rad_flux** - Average Downward Longwave Radiative Flux (MJ/m^2/day)  

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brycejohnston/agroclimatology.

## Acknowledgments

Data provided by [NASA (POWER) Agroclimatology Web Resource](http://power.larc.nasa.gov/cgi-bin/agro.cgi)

## License

The gem is available as open source under the terms of the MIT License (see [LICENSE.txt](https://github.com/brycejohnston/agroclimatology/blob/master/LICENSE.txt))
