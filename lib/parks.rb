class Parks

    def self.create_all(array)
        array.each do |park|
            self.new(park)
        end
    end


    
end