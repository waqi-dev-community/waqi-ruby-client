require 'faraday'

module Waqi
    class Client
        BASE_URL = 'https://api.waqi.info/'

        attr_reader :api_key, :adapter

        def initialize(api_key:, adapter: Faraday.default_adapter)
            @api_key = api_key
            @adapter = adapter
        end

        def connection
            @connection ||= Faraday.new do |conn|
                conn.url_prefix = BASE_URL
                conn.request :json
                conn.response :json, content_type: 'application/json'
                conn.response :raise_error, include_request: true
                conn.adapter adapter
            end
        end

        def inspect
            self
        end

        def city_feed
            CityFeedResouce.new(self)
        end
    end
end