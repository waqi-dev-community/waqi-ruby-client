module Waqi
    class CityFeedResouce < Resource
        def get_feed(city)
            get("/feed/#{city}")
        end
    end
end
