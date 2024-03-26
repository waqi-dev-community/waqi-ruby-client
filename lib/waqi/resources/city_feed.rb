require "waqi/errors"

module Waqi
    class Resource
		# Module Waqi::Resource::CityFeed provides an API for getting real-time air quality data feed.
        # For more information, visit https://aqicn.org/json-api/doc
        module CityFeed

			# Get city/station feed
            #
            # @pathparams:
            # @param `city` [String] - Name of the city (eg beijing), or id (eg @7397)
            #
            # @return [Hash] data - The station data.
            # @return [string] status - The status code. can be ok or error.
            def get_city_feed(city)
                get("/feed/#{city}")
            end

            # Get gelocalized feed based on lat/lng based
            #
            # @pathparams:
            # @param `lat` [Integer] - latitude
            # @param `lng` [Integer] - longitude
            #
            # @return [Hash] data - The real-time air quality infomrmation..
            # @return [string] status - The status code. can be ok or error.
            def get_geo_feed(lat:, lng:)
                get("/feed/geo:#{lat};#{lng}")
            end

            # Get gelocalized feed based on user's ip address
            #
            # @return [Hash] data - The real-time air quality infomrmation..
            # @return [string] status - The status code. can be ok or error.
            def get_geo_feed_by_ip
                get("/feed/here")
            end

            # Get gelocalized feed based on user's ip address
            #
            # @queryParams:
            # @param [Array] latlng - map bounds in the format [lat1,lng1,lat2,lng2,...]
            # @param [string] networks - air quality networks list. possible options are 'all', 'official' (or 'hourly') and 'citizen' (or 'airnet').
            #
            # @return [Hash] data - The real-time air quality infomrmation.
            # @return [string] status - The status code. can be ok or error.
            def map_station(latlng:, networks: 'all')
                raise Waqi::Errors::ArgumentError.new("latlng params cannot be empty") if latlng.empty?

                formattedLatLng = latlng.join(',')

                get("/map/bounds", params: { latlng: formattedLatLng, networks: networks })
            end

            # Search station by name
            #
            # @queryParams:
            # @params [string] name -  Name of the station to search
            #
            # @return [Hash] data - The list of station result.
            # @return [string] status - The status code. can be ok or error.
            def search_station(name)
                get("/search/", params: { keyword: name })
            end
        end
    end
end
