require_relative "piece"
require_relative "stepable"

class King < Piece

    include Stepable
    def symbol
        return ♔
    end

    def move_diffs
        return [ [1,1], [1,-1], [1,0], [-1,0], [-1, 1], [-1,-1], [0,1], [0,-1] ]
    end

end
