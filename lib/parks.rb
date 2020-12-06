require_relative '../config/environment'

class Parks

    @@all = []

    def initialize(attributes)
        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
          #@@all << self
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def parks_by_state(string)
        self.all.select {|park| park.state == string}
    end
    
    def self.list_parks
        self.all.each_with_index do |park, index| 
            puts "#{index+1}. #{park.name}"
        end
        #binding.pry
    end

    def park_more_info
        puts "Please enter the index number or type 'exit'."
        index = gets.strip
        while !("1"..self.all.length.to_s).include?(index)
            if index == "exit"
                return greeting
            else
                puts "Please enter a valid index number or type 'exit'"
                index = gets.strip
            end
        end

    end
    
end