require_relative '../config/environment'

class API
    BASE_URL = "https://developer.nps.gov/api/v1/parks?api_key="
    KEY = "#{ENV['API_KEY']}"

    def get_data
        uri = URI.parse(BASE_URL + KEY)
        response = Net::HTTP.get_response(uri)
binding.pry
        JSON.parse(response.body)["data"]
    end

    # parks = GetParkData.new.get_data
    # puts parks

    #binding.pry

    def parse_parks
        
        parks = JSON.parse(get_data)
binding.pry
    end

    binding.pry

    # def parse_parks
    #     parks = JSON.parse(self.get_data)
    #     #binding.pry
    #     parks.collect do |park|
    #         park["data"][]["fullName"]
    #     end   
    # end

    #binding.pry

    # parknames = GetParkData.new
    # puts parknames.parse_parks

    #parks = GetParkData.new.get_data
    #binding.pry

    #puts parks
end
