# frozen_string_literal: true

require_relative "waqi/version"

module Waqi
    autoload :Client, "waqi/client"
    autoload :Error, "waqi/error"
    autoload :Resource, "waqi/resource"

    autoload :CityFeedResouce, "waqi/resources/CityFeed"

    autoload :CityFeed, "waqi/objects/CityFeed"

end
