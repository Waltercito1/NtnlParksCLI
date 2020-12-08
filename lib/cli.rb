require_relative '../config/environment'

class CLI
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
            Parks.list_parks
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

    def thank_you
        puts "\nI hope you enjoyed using the National Parks Servive CLI.".yellow.bold
        puts "Thank you!".yellow.bold
        exit
    end

end