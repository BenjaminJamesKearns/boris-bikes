class Bike
    def working?
        if @broken == true
            false
        else
            true
        end
    end
    
    def report_broken
        @broken = true
    end
    
    def broken?
       @broken
    end
end