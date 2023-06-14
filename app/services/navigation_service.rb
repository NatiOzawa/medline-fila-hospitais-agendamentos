class NavigationService
  attr_reader :duration, :distance

  def initialize(longitude1, latitude1, longitude2, latitude2)
    @latitude1 = latitude1
    @longitude1 = longitude1
    @latitude2 = latitude2
    @longitude2 = longitude2
  end

  def calculate
    url = "https://api.mapbox.com/directions/v5/mapbox/driving-traffic/#{@longitude1},#{@latitude1};#{@longitude2},#{@latitude2}?access_token=#{ENV['MAPBOX_API_KEY']}"

    response = JSON.parse(HTTParty.get(url).body)

    @duration = response["routes"].first["duration"]
    @distance = response["routes"].first["distance"]
  end
end
