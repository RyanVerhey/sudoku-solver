# Handles behavior/state for tiles
class Sudoku::Board::Tile
  attr_reader :value
  attr_accessor :possibilities

  def initialize(value, board = nil)
    @value = value
    @board = board
    @possibilities = []
  end

  def value=(new_value)
    # TODO: Make a custom exception
    raise(ArgumentError.new("Cannot reassign an assigned tile")) if !@value.nil?
    @value = new_value
    @possibilities = []
    @value
  end

  def empty?
    @value.nil?
  end
end
