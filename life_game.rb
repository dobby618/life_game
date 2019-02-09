class LifeGame
    def self.next_generate(yourself, others)
        if yourself.status
            LivingCellRule.execute(yourself, others)
        else
            DeadCellRule.execute(yourself, others)
        end
    end
end
