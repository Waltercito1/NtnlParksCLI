require_relative '../config/environment'

class API
    BASE_URL = "https://developer.nps.gov/api/v1/parks?api_key="
    KEY = "#{ENV['API_KEY']}"

    def get_data
        uri = URI.parse(BASE_URL + KEY)
        response = Net::HTTP.get_response(uri)

        array = JSON.parse(response.body)["data"]
        #binding.pry
        #Parks.create_all(array)
        #array.each do |park|
            array.each do |park|
        #binding.pry        
                name = park.dig("fullName")
                state = park.dig("states")
                description = park.dig("description")
                Parks.new(name, state, description)
                #binding.pry        
            end
        #binding.pry
        #     park.each do |data|
        #         name = data.dig("fullName")
        #         binding.pry                
        #         state = data["states"]
        #         description = data["description"]
        #         Parks.new(name, state, description)
        #         #Parks.new(data["fullName"], data["states"], data["description"])
        # #binding.pry
        #     end
        # #binding.pry
        #     #@@all << self
        # end
    end

    # parks = GetParkData.new.get_data
    # puts parks

    #binding.pry

    #def parse_parks
    #    
    #    parks = JSON.parse(get_data)
    #end

    #binding.pry

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
