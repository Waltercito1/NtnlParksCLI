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
        puts "\nWelcome to the National Parks Servive CLI!"
        puts "******************************************"
    end

    def menu

        input = nil

        while input != "exit"
            puts "\nWhat would you like to do today?"
                sleep 0.5
            puts " - To list all US National Parks, enter '1'." 
                sleep 0.5            
            puts " - To list all US National Parks in a given state, enter '2'." 
                sleep 0.5
            puts " - To quit, type 'exit'." 
                sleep 0.5
            puts "Please type your selection and press ENTER"

            input = gets.strip
    #binding.pry
            case input
            when "1"
                Parks.list_parks
            when "2"
                load_parks_data
            end
        end
    end

end