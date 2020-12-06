require_relative '../config/environment'

class API
    BASE_URL = "https://developer.nps.gov/api/v1/parks?api_key="
    KEY = "#{ENV['API_KEY']}"

    def get_data
        attributes = {}
        uri = URI.parse(BASE_URL + KEY)
        response = Net::HTTP.get_response(uri)

        array = JSON.parse(response.body)["data"]
        array.each do |park|   
            attributes[:name] = park.dig("fullName")
            attributes[:state] = park.dig("states")
            attributes[:description] = park.dig("description")
            attributes[:directionsInfo] = park.dig("directionsInfo")
            #binding.pry       
        end

        array.each do |park|
            op_hrs = park.dig("operatingHours")
            op_hrs.each do |oh|
                op_hrs_desc = oh.dig("description")
                attributes[:op_hrs_desc] = oh.dig("description")
                #binding.pry
            end
        end
        Parks.new(attributes)
    end
end
