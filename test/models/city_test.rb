require 'test_helper'

class CityTest < ActiveSupport::TestCase
 setup do
   @city = cities(:one)
   @cityWrong = cities(:two)
 end
 
 test "should create city" do
   VCR.use_cassette("nominatim") do
   assert_difference('City.count') do
     city = City.new  name: @city.name
     city.save
      end
     end
   end

  test 'weather forecast' do
    VCR.use_cassette("weather") do
      weather = cities(:one).weather
      assert weather == 'rain'
    end
  end    
end