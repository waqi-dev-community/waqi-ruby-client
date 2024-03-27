# WAQI RUBY CLIENT

[![Gem Version](https://img.shields.io/gem/v/waqi-ruby.svg)](https://rubygems.org/gems/waqi-ruby)
[![Gem](https://img.shields.io/gem/dt/novu.waqi-ruby)](https://rubygems.org/gems/waqi-ruby/)
![Test Passing](https://github.com/waqi-dev-community/waqi-ruby-client/actions/workflows/main.yml/badge.svg)

> This is a Ruby client for communicating with the [World Air Quality Index API](https://aqicn.org/json-api/doc).

## Installation

You can install the client library via RubyGems:

```ruby
gem install waqi-ruby
```

Or add it to your Gemfile:

```ruby
gem 'waqi-ruby'
```

Then run `bundle install`.

## Usage

To use the library, first initialize the client with your API token:
```ruby
require 'waqi-ruby'

client = Waqi::Client.new(api_key: 'YOUR_API_KEY')
```

You can get your API key by visiting this [link](https://aqicn.org/api/).

**For City Feed:**
```ruby
client.get_city_feed('beijing')
```

**For Lat/Lng based Geolocalized Feed:**
```ruby
client.get_geo_feed(lat: -87.723900, lng: 41.913600)
```

**For Ip based Geolocalized Feed:**
```ruby
client.get_geo_feed_by_ip
```

**For Map Queries:**
```ruby
client.map_station(latlng: [-87.723900,41.913600], networks: 'all')
```

> **NOTE:**
> latlng datatype must be an array in the format [lat1,lng1,lat2,lng2,...].
> networks datatype must be a string and can value any of the following values - 'all', 'official' (or 'hourly') and 'citizen' (or 'airnet').

**For Station Search:**
```ruby
client.search_station("munich")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/waqi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/waqi-dev-community/waqi-ruby-client/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Waqi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/waqi-dev-community/waqi-ruby-client/blob/main/CODE_OF_CONDUCT.md).
