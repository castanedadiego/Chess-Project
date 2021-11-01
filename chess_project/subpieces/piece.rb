class Piece

    def initialize(color, board, pos)
        @color= color
        @board= board
        @pos= pos
    end

    attr_reader :color, :board, :pos

    def empty?
        self.board.empty?(pos)
    end

    def to_s
        return "#{self.symbol}"
    end

    private

    def move_into_check?(end_pos)
    end








end
