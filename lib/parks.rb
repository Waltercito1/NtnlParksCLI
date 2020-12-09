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

    def self.states_abbrev
        self.all.collect {|p| p.state}      
    end

    def self.valid_input?(input)
        if input.length == 2 && states_abbrev.include?(input)
            return true
        else
            return false
        end
    end 

    # def self.parks_by_state
    #     puts "Please enter a state abbreviation " + "(ie: ME for Maine)".colorize(:green) + " or type 'exit'."
    #     abbrev = gets.strip

    #     while !(valid_input?(abbrev.upcase))
    #         puts "In all, 28 states have National parks (29 if you include Idaho, which" 
    #         puts "has a small part of Yellowstone.), but " + "'#{abbrev}'".red + " is not one of them"
    #         puts "please try again:"
    #         abbrev = gets.strip
    #     end
    #     print_w_index(abbrev)
    #     park_more_info
    # end

    # def self.print_w_index(abbrev)
    #     self.all.each_with_index do |park, index|
    #         puts "#{index+1}. ".colorize(:red) + "#{park.name}".colorize(:green) if park.state.include?(abbrev.upcase)
    #     end
    # end

end
    
