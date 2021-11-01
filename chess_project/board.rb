require_relative "piece_dependencies"

class Board

    def initialize
        @null_piece =NullPiece.instance
        @rows= Array.new(8) {Array.new(8, @null_piece)}

        #white pieces
        self[[0,0]]= Rook.new(:white, self, [0,0] )
        self[[0,1]]= Knight.new(:white, self, [0,1] )
        self[[0,2]]= Bishop.new(:white, self, [0,2] )
        self[[0,3]]= Queen.new(:white, self, [0,3] )
        self[[0,4]]= King.new(:white, self, [0,4] )
        self[[0,5]]= Bishop.new(:white, self, [0,5] )
        self[[0,6]]= Knight.new(:white, self, [0,6] )
        self[[0,7]]= Rook.new(:white, self, [0,7] )

        #white pawns

        self[[1,0]]= Pawn.new(:white, self, [1,0] )
        self[[1,1]]= Pawn.new(:white, self, [1,1] )
        self[[1,2]]= Pawn.new(:white, self, [1,2] )
        self[[1,3]]= Pawn.new(:white, self, [1,3] )
        self[[1,4]]= Pawn.new(:white, self, [1,4] )
        self[[1,5]]= Pawn.new(:white, self, [1,5] )
        self[[1,6]]= Pawn.new(:white, self, [1,6] )
        self[[1,7]]= Pawn.new(:white, self, [1,7] )

        #black pieces
        self[[7,0]]= Rook.new(:black, self, [7,0] )
        self[[7,1]]= Knight.new(:black, self, [7,1] )
        self[[7,2]]= Bishop.new(:black, self, [7,2] )
        self[[7,3]]= Queen.new(:black, self, [7,3] )
        self[[7,4]]= King.new(:black, self, [7,4] )
        self[[7,5]]= Bishop.new(:black, self, [7,5] )
        self[[7,6]]= Knight.new(:black, self, [7,6] )
        self[[7,7]]= Rook.new(:black, self, [7,7] )

        #black pawns
        self[[6,0]]= Pawn.new(:black, self, [6,0] )
        self[[6,1]]= Pawn.new(:black, self, [6,1] )
        self[[6,2]]= Pawn.new(:black, self, [6,2] )
        self[[6,3]]= Pawn.new(:black, self, [6,3] )
        self[[6,4]]= Pawn.new(:black, self, [6,4] )
        self[[6,5]]= Pawn.new(:black, self, [6,5] )
        self[[6,6]]= Pawn.new(:black, self, [6,6] )
        self[[6,7]]= Pawn.new(:black, self, [6,7] )

    end

    public

    attr_accessor :rows

    def [](pos)
        row, col = pos
        return @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def empty?(pos)
        self[pos] == @null_piece
    end

    def move_piece(start_pos, end_pos)

        if self[start_pos] == @null_piece
            raise "there is no piece there"
        end

        moving_piece= self[start_pos] #'select' piece to be moved

        if moving_piece.moves.include?(end_pos)
            self[start_pos]= @null_piece
            self[end_pos]= moving_piece
        else
            raise "not a valid move"
        end

    end

    def valid_pos?(pos)
        x,y = pos
        return true unless x>7 || x<0 || y>7 || y<0
    end



    private

end
