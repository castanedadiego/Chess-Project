require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable

    def symbol
        return ♕
    end


    private

    def move_dirs
        vert_hors_dirs.concat(diagonal_dirs)
    end



end
