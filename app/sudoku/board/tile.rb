# Handles behavior/state for tiles
class Sudoku::Board::Tile
  def initialize(value)
    @value = value
  end

  def value=(new_value)
    # TODO: Make a custom exception
    raise(ArgumentError.new("Cannot reassign an assigned tile")) if !@value.nil?
    @value = new_value
  end
end
