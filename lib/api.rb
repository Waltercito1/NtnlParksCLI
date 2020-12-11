require_relative '../config/environment'

class API
    BASE_URL = "https://developer.nps.gov/api/v1/parks?limit=497&api_key="   ## all parks 497
    KEY = "#{ENV['API_KEY']}"

    def get_data
        uri = URI.parse(BASE_URL + KEY)
        response = Net::HTTP.get_response(uri)

        array = JSON.parse(response.body)["data"]
        array.each do |park|
            attributes = {name: park["fullName"], 
            state: park["states"], 
            description: park["description"],
            directionsInfo: park["directionsInfo"]}
            op_hrs = park.dig("operatingHours")         #Sometimes Operating Hours is nil
            op_hrs.each do |oh|
                op_hrs_desc = oh.dig("description")
                attributes[:op_hrs_desc] = oh.dig("description")
            end
            Park.new(attributes)
        end
    end
end
