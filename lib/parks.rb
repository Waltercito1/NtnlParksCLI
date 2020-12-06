require_relative '../config/environment'

class Parks
    attr_accessor :name, :state, :description

    @@all = []

    def initialize (name, state, description)
        @name = name
        @state  = state
        @description = description
        @@all << self
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