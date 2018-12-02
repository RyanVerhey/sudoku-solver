# Deals with handling state of the board and any board-related behavior
class Sudoku::Board
  attr_reader :matrix
  SQUARE_COORDS = [(0..2), (3..5), (6..8)]

  def initialize(puzzle)
    tiles = puzzle.map { |value| Tile.new(value, self) }
    @matrix = Matrix[*tiles.each_slice(9).to_a]
  end

  def tiles
    @matrix.to_a.flatten
  end

  def solved?
    !tiles.any?(&:empty?)
  end

  def get_tile(row, column)
    @matrix[row, column]
  end

  def get_row_for_tile(tile)
    tile_index = @matrix.index(tile)
    @matrix.row(tile_index.first).to_a
  end

  def get_column_for_tile(tile)
    tile_index = @matrix.index(tile)
    @matrix.column(tile_index[1]).to_a
  end

  # Corresponds to index in SQUARE_COORDS. Index 0-2 (the first square in
  # row/column), that number divided by 3 will return 0, getting the first
  # element from SQUARE_COORDS. Index 3-5 (the second square in row/column),
  # that number divided by 3 will be 1, getting us the second element, and so
  # on. That way, it gets us the ranges of the square that the tile is in.
  def get_square_for_tile(tile)
    tile_index = @matrix.index(tile)
    square_row_coords = tile_index.first / 3
    square_column_coords = tile_index[1] / 3
    @matrix.minor(SQUARE_COORDS[square_row_coords],
                  SQUARE_COORDS[square_column_coords]).to_a.flatten
  end
end


