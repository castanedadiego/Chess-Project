module Slideable

    public

    def vert_hors_dirs
        VERT_HOR_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves= []

        move_dirs.each do |dx, dy|
            moves.concat(grow_unblocked_moves_in_dir(dx, dy) )
        end

        moves
    end

    private

    def move_dirs
        #should be overwritten by each class
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        returned_moves=[]
        x, y = self.pos
        potential_move= [x+dx, y+dy]
        while self.board.valid_pos?(potential_move) #in bounds
            if self.board.empty?(potential_move)
                returned_moves << potential_move
            else
                returned_moves << potential_move if self.board[potential_move].color != self.color # not empty and opposite color means capturable
                break
            end
            potential_move= [potential_move[0]+dx, potential_move[1]+dy]
        end
        return returned_moves
    end

    DIAGONAL_DIRS= [[1,1],[-1,-1],[1,-1],[-1,1]]
    VERT_HOR_DIRS= [[1,0],[-1,0],[0,1],[0,-1]]

end
