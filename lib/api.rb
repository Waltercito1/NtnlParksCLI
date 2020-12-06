require_relative '../config/environment'

class API
    BASE_URL = "https://developer.nps.gov/api/v1/parks?api_key="
    KEY = "#{ENV['API_KEY']}"

    def get_data
        hash = {}
        uri = URI.parse(BASE_URL + KEY)
        response = Net::HTTP.get_response(uri)

        array = JSON.parse(response.body)["data"]
        array.each do |park|
        #binding.pry        
            name = park.dig("fullName")
            hash[:name] = park.dig("fullName")
            state = park.dig("states")
            hash[:state] = park.dig("states")
            description = park.dig("description")
            hash[:description] = park.dig("description")
            directionsInfo = park.dig("directionsInfo")
            hash[:directionsInfo] = park.dig("directionsInfo")
            #Parks.new(name, state, description, directionsInfo)
            #binding.pry       
        end

        array.each do |park|
            op_hrs = park.dig("operatingHours")
            op_hrs.each do |oh|
                op_hrs_desc = oh.dig("description")
                hash[:op_hrs_desc] = oh.dig("description")
                #binding.pry
            end
        end
        binding.pry
        Parks.new(hash)
    end
end
