require_relative '../config/environment'

class Parks

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
    
    

end