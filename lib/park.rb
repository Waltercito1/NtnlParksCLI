require_relative '../config/environment'

class Park
    
    @@all = []

    def initialize(attributes)
        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
        end
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.states_abbrev
        self.all.collect {|p| p.state}      
    end
end
    
