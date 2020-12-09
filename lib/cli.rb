require_relative '../config/environment'

class CLI
    def run
        greeting
        load_parks_data
        menu
        list_parks
    end

    def load_parks_data
        API.new.get_data
    end

    def greeting
        puts "\nWelcome to the National Parks Servive CLI!".red.bold
        puts "******************************************"
        puts "The United States National Parks have been called 'America's Best Idea'"
        puts "and I can't really argue with that!"
        #puts "\nWhat would you like to do today?"
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
            Parks.parks_by_state
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
            menu
        when "q"
            thank_you
        end
        
    end

    def list_parks
        all_parks = []
        Parks.all.each_with_index do |park, index| 
            all_parks << "#{index+1}.".colorize(:red) + "#{park.name}".colorize(:green)
        end
        message_2
        puts "\nListig all US National Parks, 25 at the time and in alphabetical order:"
        puts all_parks#[0..24]
        puts "Press ENTER to load more or..."

        #binding.pry
        park_more_info
    end

    def park_more_info
        puts "\nEnter the index number of the park to find out more"
        puts "information about it. Type 'exit' to return to the menu."
        usr_index = gets.strip
        while !("1"..Parks.all.length.to_s).include?(usr_index)
            if usr_index == "exit"
                #exit
                #CLI.new.menu
                menu
            else
                puts "Please enter a valid index number or type 'exit'"
                usr_index = gets.strip
            end
        end
        additional_info(usr_index)
    end

    def additional_info(usr_index)
        Parks.all.each_with_index do |park, index|
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
                #CLI.new.what_next
                what_next
                #park_more_info
            end
        end
    end

    def message_2
        puts "The U.S. is home to an astonishing 421 national parks,"
        puts "monuments and nationally protected lands comprising the "
        puts "vast National Park Service (NPS) system.\n"
    end

    def thank_you
        puts "\nI hope you enjoyed using the National Parks Servive CLI.".yellow.bold
        puts "Thank you!".yellow.bold
        exit
    end

end