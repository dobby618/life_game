class Cell
    attr_accessor :status
    
    def initialize(status)
        @status = status
    end

    def live!
        @status = true
    end
    
    def dead!
        @status = false
    end
end