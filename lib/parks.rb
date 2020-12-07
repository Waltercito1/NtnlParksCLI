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
        #binding.pry
        park_more_info
    end
    
    def self.park_more_info
        puts "\nPlease enter the index number of the park to find out more"
        puts "information about it, or type 'exit' to return to the menu."
        usr_index = gets.strip
        while !("1"..self.all.length.to_s).include?(usr_index)
            if usr_index == "exit"
                exit
            else
                puts "Please enter a valid index number or type 'exit'"
                usr_index = gets.strip
            end
        end
        additional_info(usr_index)
    end

    def self.parks_by_state
        puts "Please enter the state abbreviation or type 'exit'."
        abbrev = gets.strip
        self.all.each_with_index do |park, index| 
            puts "#{index+1}. #{park.name}" if park.state.include?(abbrev.upcase)
        end
        park_more_info
    end

    def self.additional_info(usr_index)
        self.all.each_with_index do |park, index|
            if index+1 == usr_index.to_i
    #binding.pry
                puts "#{park.name}, #{park.state}"
                puts "Description:\n#{park.description}" 
            end
        end
    #binding.pry
    end

end
    
