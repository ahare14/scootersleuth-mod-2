require 'rest-client'
require 'json'
require 'mapquest'


class Location < ApplicationRecord
    has_many :favorites

  @@mapquest = MapQuest.new('')




  def self.get_location(address)
    data = @@mapquest.geocoding.address(address)
    data.locations.each do |location|
      address = "#{location[:street]}, #{location[:adminArea5]}, #{location[:adminArea3]} #{location[:postalCode]}"
      lat = location[:latLng][:lat]
      lng = location[:latLng][:lng]
      Location.create(address: address, latitude: lat, longitude: lng)
    end
  end


end
