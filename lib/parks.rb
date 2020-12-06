require_relative '../config/environment'

class Parks
    attr_accessor :name, :state, :description, :directionsInfo

    @@all = []

    def initialize (name, state, description, directionsInfo)
        @name = name
        @state  = state
        @description = description
        @directionsInfo = directionsInfo
        @@all << self
        #binding.pry
    end

    def self.all
        @@all
    end
    
    # def self.create_all(array)
    # binding.pry
    #     array.each do |park|
    #         park.each do |data|
    #             self.new(data["fullName"], data["states"], data["description"])
    #         end
    #         @@all << self
    #     end
    # end
    # binding.pry

end