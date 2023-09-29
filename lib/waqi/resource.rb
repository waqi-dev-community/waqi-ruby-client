module Waqi
    class Resource
        attr_reader :client

        def initialize(client)
            @client = client
        end

        def get(url, params: {}, headers: {})
            client.connection.get(default_url(url), params, headers)
        end

        def default_url(url)
            url+"?token=#{client.api_key}"
        end
    end
end