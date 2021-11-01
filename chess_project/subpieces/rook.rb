require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    def symbol
        return ♖
    end

    private

    def move_dirs
        vert_hors_dirs
    end

end
