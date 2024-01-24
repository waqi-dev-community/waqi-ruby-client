module Waqi
    class Resource
        module CityFeed
            def get_city_feed(city)
                get("/feed/#{city}")
            end
        end
    end
end
