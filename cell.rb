class Cell
    # status 自分は生きてるの？死んでるの？
    # 0: dead
    # 1: living
    attr_accessor :status
    attr_accessor :display_status
    
    # 周りのセルの状態を持つ。
    # 配列で持つよ。
    attr_accessor :status_of_cells_around
    
    # 自分の周りの生きてるセルを数える
    def count_living_cells_around_me
        status_of_cells_around.count(true)
    end
    
    # 動いてるのを見たいので、四角を表示する
    def print_status
        print @display_status
    end
end

# 生きてるセル
class LivingCell < Cell
    def initialize
        @status = true
        @display_status = "■"
    end
    
    def life_and_death_rule(num_of_arounding_living_cells)
        return status if num_of_arounding_living_cells == 2
        return status if num_of_arounding_living_cells == 3 
        false
    end
end

# 死んでいるセル
class DeadCell < Cell
    def initialize
        @status = false
        @display_status = "□"
    end

    def life_and_death_rule(num_of_arounding_living_cells)
        return true if num_of_arounding_living_cells == 3
        status        
    end
end