# Deals with handling state of the board and any board-related behavior
class Sudoku::Board
  attr_reader :board

  def initialize(puzzle)
    tiles = puzzle.map { |value| Tile.new(value) }
    @board = Matrix[tiles.each_slice(9).to_a]
  end
end


