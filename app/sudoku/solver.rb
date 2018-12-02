# Will hold all code relating to solving puzzle
class Sudoku::Solver
  def initialize(board)
    @board = board
  end

  def solve
    counter = 0

    while !@board.solved?
      @board.tiles.each do |tile|
        row = @board.get_row_for_tile(tile)
        column = @board.get_column_for_tile(tile)
        square = @board.get_square_for_tile(tile)

        if tile.empty?
          (1..9).to_a.each do |num|

            if !row.map(&:value).include?(num) &&
               !column.map(&:value).include?(num) &&
               !square.map(&:value).include?(num)
              tile.possibilities << num unless tile.possibilities.include?(num)
            else
              tile.possibilities.delete(num)
            end
          end
        end
      end

      empty_tiles = @board.tiles.select(&:empty?)
      empty_tiles.each do |tile|
        row = @board.get_row_for_tile(tile)
        column = @board.get_column_for_tile(tile)
        square = @board.get_square_for_tile(tile)

        if tile.possibilities.length == 1
          tile.value = tile.possibilities.first
        end
      end

      counter += 1
      break if counter >= 10_000
    end
    puts counter
    @board.tiles.map(&:value)
  end
end
