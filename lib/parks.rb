require_relative '../config/environment'

class Parks

    @@all = []

    def initialize(attributes)
        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
          @@all << self
        end
        #binding.pry
        puts name
        #list_parks
    end

    def self.all
        @@all
    end

    def parks_by_state(string)
        self.all.select {|park| park.state == string}
    end
    
    def self.list_parks
        self.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |name, index|
            puts "#{index}. #{name}"
        end
    end
    
end