require_relative '../config/environment'

class Parks

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

    def self.list_parks
        all_parks = []
        self.all.each_with_index do |park, index| 
            all_parks << "#{index+1}. #{park.name}"
        end
        puts all_parks
        binding.pry
        park_more_info
    end
    
    def self.park_more_info
        puts "Please enter the index number or type 'exit'."
        index = gets.strip
        while !("1"..self.all.length.to_s).include?(index)
            if index == "exit"
                exit
            else
                puts "Please enter a valid index number or type 'exit'"
                index = gets.strip
            end
        end
    end

    def self.parks_by_state
        puts "Please enter the state abbreviation or type 'exit'."
        abbrev = gets.strip
        #self.all.select {|park| park.state == abbrev}
        self.all.each do |p|
            #binding.pry
            #p.state.collect {|park| park.state.include?(abbrev.upcase)}
            puts p.name if p.state.include?(abbrev.upcase)
            #binding.pry
        end
    end


end
    
