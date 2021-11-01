module Stepable

    def moves
        moves =[]
        x, y = self.pos

        self.move_diffs.each do |move|
            dx, dy= move
            potential_move = [x+dx, y+dy]

            if self.board.valid_pos?(potential_move) #free, valid square
                if self.board[potential_move].empty?
                    moves << potential_move
                elsif self.board[potential_move].color != self.color && self.board.valid_pos?(potential_move) #can capture a piece
                    moves << potential_move
                end
            end

        end

        moves
    end

    def move_diffs
        #should be overwritten by class
        raise NotImplementedError
    end

end
