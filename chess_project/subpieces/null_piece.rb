require_relative 'piece'
require 'singleton'

class NullPiece < Piece

    attr_reader :color, :symbol

    include Singleton

    def initialize
        @color= :none
        @symbol= "_"
    end

    def empty?
        true
    end

    def moves
        []
    end

end
