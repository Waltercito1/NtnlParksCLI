class CLI
    def run
        greeting
        menu
        load_parks_data
    end

    def load_parks_data
        API.new.get_data
    end

    def greeting
        puts "\nWelcome to the National Parks Servive CLI!"
    end

    def menu
        input = nil
    
        while input != "exit"
            puts "What would you like to do?"
            puts "To list all US National Parks, enter '1'."
            puts "To list all US National Parks in a given state, enter '2'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
    
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