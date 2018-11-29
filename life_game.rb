require "./map"
require "./cell"

class LifeGame
    BOOLEAN_LIVING_STATUS = true
    BOOLEAN_DEAD_STATUS = false
    STRING_LIVING_STATUS = "■"
    STRING_DEAD_STATUS = "□"

    attr_accessor :height_size
    attr_accessor :width_size
    attr_accessor :map

    def initialize(map)
        @map = map
        convert_cells_to_object
    end
    
    def measure_heigth_size
        @map.size
    end

    def measure_width_size
        return 0 if @map.size.zero?
        map[0].size
    end
    
    
    def convert_cells_to_object
        index = 0
        array

        height_size.times do |h|
            width_size.times do |w|
                @map[h][w] == STRING_LIVING_STATUS ? array.push(LivingCell.new(index)) : array.push(DeadCell.new(index))
                index += 1
            end
        end
    end

    def convert_cells_to_string
    end
    
    # def print(sleep_time = 2)
    #     print_this_generation
        
    #     loop do
    #         sleep sleep_time
    #         p "---------------"
    #         print_next_generation
    #     end
    # end
    
    # private
    
    # # ライフゲームの画面（いきてる：■　死んでる：□　で表現する）
    # # 次世代の画面
    # def print_next_generation
    #     @map.change_status_to_next_generation
    #     print_this_generation
    # end

    # # 今世代の画面
    # def print_this_generation
    #     @map.print_all_status
    # end
end

# #----------------------------------------
# # 初期設定
# # プリンカー
# # length = 5
# # map = Map.new(length)
# # map.cells[2][1] = LivingCell.new
# # map.cells[2][2] = LivingCell.new
# # map.cells[2][3] = LivingCell.new

# # ビーコン
# length = 6
# # map = Map.new(length)
# # map.set_living_cell(1, 1)
# # map.cells[1][2] = LivingCell.new
# # map.cells[2][1] = LivingCell.new
# # map.cells[2][2] = LivingCell.new

# # map.cells[3][3] = LivingCell.new
# # map.cells[3][4] = LivingCell.new
# # map.cells[4][3] = LivingCell.new
# # map.cells[4][4] = LivingCell.new

# life_game = LifeGeme.new(map)
# life_game.print


init_map = [
 %w(□ □ □ □ □ □),
 %w(□ ■ ■ □ □ □),
 %w(□ ■ ■ □ □ □),
 %w(□ □ □ ■ ■ □),
 %w(□ □ □ ■ ■ □),
 %w(□ □ □ □ □ □)
]


life_game = LifeGame.new(init_map)
# life_game.