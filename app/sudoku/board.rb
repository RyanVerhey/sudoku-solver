# Deals with handling state of the board and any board-related behavior
class Sudoku::Board
  attr_reader :board

  SQUARE_COORDS = [
    [(0..2), (0..2)],
    [(0..2), (3..5)],
    [(0..2), (6..8)],
    [(3..5), (0..2)],
    [(3..5), (3..5)],
    [(3..5), (6..8)],
    [(6..8), (0..2)],
    [(6..8), (3..5)],
    [(6..8), (6..8)]
  ]

  def initialize(puzzle)
    tiles = puzzle.map { |value| Tile.new(value) }
    @board = Matrix[tiles.each_slice(9).to_a]
  end
end


