# Deals with all overarching game-related code
class Sudoku
  def initialize(puzzle)
    @board = Board.new(puzzle)
  end

  def solve
    Solver.new(@board).solve
  end
end
