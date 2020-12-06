require_relative '../config/environment'

class Parks
    #attr_accessor :name, :state, :description, :directionsInfo

    @@all = []

    def initialize(attributes)
        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
          @@all << self
        end
        binding.pry
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