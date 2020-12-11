require_relative '../config/environment'

class API
    BASE_URL = "https://developer.nps.gov/api/v1/parks?limit=497&api_key="   ## all parks 497
    #BASE_URL = "https://developer.nps.gov/api/v1/parks?api_key="    ##Default limit of 50 parks
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
            #op_hrs_desc: park.dig("operatingHours")[0]["description"]}   #does not work
            #op_hrs_desc: park["operatingHours"][0]["description"]}       #does not work either
            #binding.pry
            
            op_hrs = park.dig("operatingHours")         #Sometimes OH is nil
            op_hrs.each do |oh|
                op_hrs_desc = oh.dig("description")
                attributes[:op_hrs_desc] = oh.dig("description")
            end
            #binding.pry
            Park.new(attributes)
        end
    end
end
