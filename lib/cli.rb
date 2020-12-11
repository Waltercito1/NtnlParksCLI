require_relative '../config/environment'

class CLI
    attr_accessor :counter

    def initialize
        @counter = 0
    end

    def run
        greeting
        load_parks_data
        menu
    end

    def load_parks_data
        API.new.get_data
    end

    def greeting
        puts "\nWelcome to the National Parks Servive CLI!".red.bold
        puts "******************************************"
        puts "The United States National Parks have been called 'America's Best Idea'"
        puts "and I can't really argue with that!"
        puts "\nLoading parks' data..."
    end

    def menu
        puts "\nMain menu:".red.bold
        puts "What would you like to do?".green
            sleep 0.5
        puts " - To list all US National Parks, enter '1'."   
        puts " - To list all US National Parks in a given state, enter '2'." 
        puts " - To quit, type 'Q'." 
        puts "\nPlease type your selection and press ENTER".green
    
        until ["1", "2", "q", "Q"].include?(user_input = gets.strip)
            puts "Please enter a valid input:"
        end
        case user_input.downcase
        when "1"
            list_parks
        when "2"
            parks_by_state
        when "q"
            thank_you
        end
        
    end

    def what_next
        puts "\nWhat would you like to do next?".green
        puts " - To return to the main menu, type '1'." 
        puts " - To quit, type 'Q'."
        puts "\nPlease type your selection and press ENTER".green
            
        until ["1", "q", "Q"].include?(user_input = gets.strip)
            puts "Please enter a valid input:"
        end
        case user_input
        when "1"
            @counter = 0
            menu
        when "q"
            thank_you
        end
    end

    def list_parks
        all_parks = []
        Park.all.each_with_index do |park, index| 
            all_parks << "#{index+1}.".colorize(:red) + "#{park.name}".colorize(:green)
        end
        us_parks_message
        puts "\nListig all US National Parks, 25 at the time and in alphabetical order:"
        puts all_parks[@counter..@counter+24]
        load_more_message

        while counter <= Park.all.length 
            more_indexes = gets.strip.downcase 
            if more_indexes == "c"
                @counter += 25
                puts all_parks[@counter..@counter+24]
                load_more_message  
            elsif more_indexes == "exit"
                @counter = 0
                menu
            else
                park_more_info(more_indexes)
            end
        end

        #puts "Press 'c' to load more or..."
        
        park_more_info
    end

    def park_more_info(usr_index = nil)
        while !("1"..Park.all.length.to_s).include?(usr_index)
            if usr_index == "exit"
                @counter = 0
                menu
            else
                puts "Please enter a valid index number or type 'exit'"
                usr_index = gets.strip
            end
        end
        additional_info(usr_index)
    end

    def additional_info(usr_index)
        Park.all.each_with_index do |park, index|
            if index+1 == usr_index.to_i
                puts "#{park.name}, #{park.state}".colorize(:green)
                puts "Description:".colorize(:red)
                puts park.description
                puts "\nGetting There:".colorize(:red)
                puts park.directionsInfo
                puts "\nHours of Operation:".colorize(:red)
                puts park.op_hrs_desc
                sleep 2

                what_next
            end
        end
    end

    def parks_by_state
        puts "Please enter a state abbreviation " + "(ie: ME for Maine)".colorize(:green) + " or type 'exit'."
        abbrev = gets.strip

        while !(valid_input?(abbrev.upcase))
            puts "In all, 28 states have National parks (29 if you include Idaho, which" 
            puts "has a small part of Yellowstone.), but " + "'#{abbrev}'".red.bold + " is not one of them"
            puts "please try again:"
            abbrev = gets.strip
        end
        print_w_index(abbrev)
        park_more_info
    end

    def print_w_index(abbrev)
        Park.all.each_with_index do |park, index|
            puts "#{index+1}. ".colorize(:red) + "#{park.name}".colorize(:green) if park.state.include?(abbrev.upcase)
        end
    end

    def valid_input?(input)
        if input.length == 2 && Park.states_abbrev.include?(input)
            return true
        else
            return false
        end
    end 

    def us_parks_message
        puts "The U.S. is home to an astonishing 421 national parks,"
        puts "monuments and nationally protected lands comprising the "
        puts "vast National Park Service (NPS) system.\n"
    end

    def choose_index_message
        puts "\nEnter the index number of the park to find out more"
        puts "information about it. Type 'exit' to return to the menu."
    end

    def load_more_message
        puts "Type 'c' to load more parks " + "OR ".yellow.bold + "Enter the index number of the park to find out more"
        puts "Type 'exit' to return to the menu."
    end

    def thank_you
        puts "\nI hope you enjoyed using the National Parks Servive CLI.".yellow.bold
        puts "Thank you!".yellow.bold
        exit
    end
end