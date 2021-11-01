require_relative "piece"

class Pawn < Piece

    def symbol
        return ♙
    end

    def forward_dir
        dir = self.color == :white ? 1 : -1
        return dir
    end

    def capture_moves
        x,y = self.pos
        capture_moves= []
        capture_diff = [[self.forward_dir, -1], [self.forward_dir, 1] ]
        capture_moves.each do |dx, dy|
            potential_move= [x+dx, y+dy]

            if self.board[potential_move].empty? == false && self.board.valid?(potential_move) #if space is occupied
                if self.board[potential_move].color != self.color #different color piece, can capture, add to potential move
                    capture_moves << potential_move
                end
            end
        end
        capture_moves
    end

    def forward_move
        x,y = self.pos
        forward_pos= [x+forward_dir, y]
        fwd_square= self.board[[x+forward_dir, y]]

        if self.board.valid_pos?(forward_pos) && fwd_square.empty?
            return [[x+forward_dir, y]]
        end
    end

    def at_start_row?
        start_row = (self.color == :white) ? 1 : 6
        p start_row
        if self.pos[0] == start_row
            return true
        else
            return false
        end
    end

    def double_move
        x, y = self.pos
        potential_square=  [x+(2*forward_dir), y]
        if self.at_start_row? && self.board.empty?(potential_square) && self.board.valid_pos?(potential_square)
            return [potential_square]
        end
    end

    def moves
        all_moves= []
        all_moves.concat(capture_moves, forward_move, double_move)

        return all_moves
    end

end
