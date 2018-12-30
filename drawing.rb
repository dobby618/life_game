class Drawing
    attr_accessor :cells
    MARKERS = { cui: { alive: "■", dead: "□" } }

    def print_cui
        cells.each do |cell|
            print MARKERS[:cui][cell.status]
            
            if cell.crlf
                print "\n"
            end
        end
        print_line_for_cui
    end
    
    private
    
    def print_line_for_cui
        p "-------------"
    end
end