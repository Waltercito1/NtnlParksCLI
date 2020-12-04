require_relative '../config/environment'

class API
    BASE_URL = "https://developer.nps.gov/api/v1/parks"
    KEY = "#{ENV['API_KEY']}"

    def get_data

        @park_code = "?api_key=" #"?parkCode=acad&api_key="

        uri = URI(BASE_URL + park_code + KEY) 
        response = Net::HTTP.get(uri)
        formatted_resp = JSON.parse(response)

        @data = formatted_resp["data"]
    end
    binding.pry

    def parse_parks
        
    end

end