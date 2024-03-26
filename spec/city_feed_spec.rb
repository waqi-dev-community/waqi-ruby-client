# frozen_string_literal: true

require "webmock/rspec"
require "waqi/errors"
require_relative "../lib/waqi"
require_relative "../lib/waqi/resources/city_feed"

RSpec::describe Waqi::Resource::CityFeed do
    let(:api_key) { "1234567890" }
    let(:client) { Waqi::Client.new(api_key: api_key) }
    let(:base_uri) { "https://api.waqi.info" }
    let(:longitude) { 41.913600 }
    let(:latitude) { -87.723900 }
    let(:response_body) {
        {
            status: "ok",
            data: {
                idx:7397,
                aqi:71,
                time:{},
                city:{},
                iaqi:{},
                forecast:{}
            }
        }
    }

    describe "#get_city_feed" do
        it "Get city/station feed" do
            city = "newyork"

            stub_request(:get, "#{base_uri}/feed/#{city}?token=#{api_key}")
                .to_return(status: 200, body: response_body.to_json)

            result = client.get_city_feed(city)
            result = JSON.parse(result, symbolize_names: true)
            expect(result).to eq(response_body)
            expect(result[:status]).to eq("ok")
        end
    end

    describe "#get_geo_feed" do
        it "Get geolocalised feed" do
            stub_request(:get, "#{base_uri}/feed/geo:#{latitude};#{longitude}?token=#{api_key}")
                .to_return(status: 200, body: response_body.to_json)

            result = client.get_geo_feed(lat: latitude, lng: longitude)
            result = JSON.parse(result, symbolize_names: true)
            expect(result).to eq(response_body)
            expect(result[:status]).to eq("ok")
        end
    end

    describe "#get_geo_feed_by_ip" do
        it "Get geolocalised feed by ip address" do
            stub_request(:get, "#{base_uri}/feed/here?token=#{api_key}")
                .to_return(status: 200, body: response_body.to_json)

            result = client.get_geo_feed_by_ip
            result = JSON.parse(result, symbolize_names: true)
            expect(result).to eq(response_body)
            expect(result[:status]).to eq("ok")
        end
    end

    describe "#map_station" do
        it "Get stations on map" do
            stub_request(:get, "#{base_uri}/map/bounds?latlng=#{latitude},#{longitude}&networks=all&token=#{api_key}")
                .to_return(status: 200, body: response_body.to_json)

            result = client.map_station(latlng: [latitude,longitude])
            result = JSON.parse(result, symbolize_names: true)
            expect(result).to eq(response_body)
            expect(result[:status]).to eq("ok")
        end

        it "latlng params must not be empty" do
            expect { client.map_station(latlng: []) }.to raise_error(Waqi::Errors::ArgumentError, "latlng params cannot be empty")
        end
    end

    describe "#search_station" do
        it "search stations by name" do
            station = "beijing"
            stub_request(:get, "#{base_uri}/search/?keyword=#{station}&token=#{api_key}")
                .to_return(status: 200, body: response_body.to_json)

            result = client.search_station(station)
            result = JSON.parse(result, symbolize_names: true)
            expect(result).to eq(response_body)
            expect(result[:status]).to eq("ok")
        end
    end
end
