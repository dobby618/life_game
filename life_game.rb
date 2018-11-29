require "./map"
require "./cell"

class LifeGame
    attr_accessor :map

    def initialize(map)
        @map = map
        @map.set_neighboring_cells
    end
    
    def print(sleep_time = 2)
        print_this_generation
        
        loop do
            sleep sleep_time
            p "---------------"
            print_next_generation
        end
    end
    
    private
    
    # ライフゲームの画面（いきてる：■　死んでる：□　で表現する）
    # 次世代の画面
    def print_next_generation
        @map.change_status_to_next_generation
        print_this_generation
    end

    # 今世代の画面
    def print_this_generation
        @map.print_all_status
    end
end

#----------------------------------------
# 初期設定
# プリンカー
# length = 5
# map = Map.new(length)
# map.cells[2][1] = LivingCell.new
# map.cells[2][2] = LivingCell.new
# map.cells[2][3] = LivingCell.new

# ビーコン
length = 6
map = Map.new(length)
map.cells[1][1] = LivingCell.new
map.cells[1][2] = LivingCell.new
map.cells[2][1] = LivingCell.new
map.cells[2][2] = LivingCell.new

map.cells[3][3] = LivingCell.new
map.cells[3][4] = LivingCell.new
map.cells[4][3] = LivingCell.new
map.cells[4][4] = LivingCell.new

life_game = LifeGame.new(map)
life_game.print
