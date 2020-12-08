require_relative '../config/environment'

class Parks < CLI
        include Paramable
       # attr_accessor :states_abbrev
    
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

    def self.list_parks
        all_parks = []
        self.all.each_with_index do |park, index| 
            all_parks << "#{index+1}.".colorize(:red) + "#{park.name}".colorize(:green)
        end
        message_2
        puts "\nListig all US National Parks, 25 at the time and in alphabetical order:"
        puts all_parks[0..24]
        puts "Press ENTER to load more or..."

        #binding.pry
        park_more_info
    end
    
    def self.park_more_info
        puts "\nEnter the index number of the park to find out more"
        puts "information about it. Type 'exit' to return to the menu."
        usr_index = gets.strip
        while !("1"..self.all.length.to_s).include?(usr_index)
            if usr_index == "exit"
                #exit
                CLI.new.menu
            else
                puts "Please enter a valid index number or type 'exit'"
                usr_index = gets.strip
            end
        end
        additional_info(usr_index)
    end

    def self.valid_input?(input)
        input.upcase
        if input.length == 2 && states_abbrev.include?(input)
            return true
        else
            return false
        end
    end 

    def self.parks_by_state
        puts "Please enter a state abbreviation " + "(ie: ME for Maine)".colorize(:green) + " or type 'exit'."
        abbrev = gets.strip

        while !(valid_input?(abbrev))
            puts "please try again"
            abbrev = gets.strip
        end
        print_w_index(abbrev)
        park_more_info
    end

    def self.print_w_index(abbrev)
        self.all.each_with_index do |park, index|
            puts "#{index+1}. ".colorize(:red) + "#{park.name}".colorize(:green) if park.state.include?(abbrev.upcase)
        end
    end

    def self.additional_info(usr_index)
        self.all.each_with_index do |park, index|
            #binding.pry
            if index+1 == usr_index.to_i
                puts "#{park.name}, #{park.state}".colorize(:green)
                puts "Description:".colorize(:red)
                puts park.description
                puts "\nGetting There:".colorize(:red)
                puts park.directionsInfo
                puts "\nHours of Operation:".colorize(:red)
                puts park.op_hrs_desc
                sleep 2
                CLI.new.what_next
                #park_more_info
            end
        end
    end

    def self.message_2
        puts "The U.S. is home to an astonishing 421 national parks,"
        puts "monuments and nationally protected lands comprising the "
        puts "vast National Park Service (NPS) system.\n"
    end
end
    
