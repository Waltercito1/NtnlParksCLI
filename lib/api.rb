require_relative '../config/environment'

BASE_URL = "https://developer.nps.gov/api/v1/parks"
park_code = "?api_key=" #"?parkCode=acad&api_key="
KEY = "#{ENV['API_KEY']}"

uri = URI(BASE_URL + park_code + KEY) 
response = Net::HTTP.get(uri)
formatted_resp = JSON.parse(response)

data = formatted_resp["data"]

binding.pry