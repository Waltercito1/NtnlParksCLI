require_relative '../config/environment'

class API
    BASE_URL = "https://developer.nps.gov/api/v1/parks?api_key="
    KEY = "#{ENV['API_KEY']}"

    def get_data
        uri = URI.parse(BASE_URL + KEY)
        response = Net::HTTP.get_response(uri)

        array = JSON.parse(response.body)["data"]
        array.each do |park|
        #binding.pry        
            name = park.dig("fullName")
            state = park.dig("states")
            description = park.dig("description")
            Parks.new(name, state, description)
            #binding.pry        
        end
    end
end
