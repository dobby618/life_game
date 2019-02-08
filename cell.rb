class Cell
    attr_accessor :status
    
    def initialize(status)
        @status = status
    end
    
    def next_generate(other)
        if @status == other.status
            self.live!
            other.live!
        else
            self.dead!
            other.dead!
        end
    end
    
    def live!
        @status = true
    end
    
    def dead!
        @status = false
    end
end