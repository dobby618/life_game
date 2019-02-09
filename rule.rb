class Rule
    def self.count_living_others(others)
        others.inject(0){|result, n| (result + 1) if n.status}
    end
end

class LivingCellRule < Rule
    def self.execute(yourself, others)
        living_others_size = count_living_others(others)
        
        if living_others_size == 1
            yourself.live!
        else
            yourself.dead!
        end
    end
end

class DeadCellRule < Rule
    def self.execute(yourself, others)
        living_others_size = count_living_others(others)
        
        if living_others_size == 1
            others.each {|other| other.dead!}
        else
            yourself.live!
            others.each {|other| other.live!}
        end
    end
end
