
require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable

    def symbol
        return ♘
    end



    def move_diffs
        return [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-2]]
    end


end
