class Sudoku::BoardTest < MiniTest::Test
  def setup
    board = [1, 3, 6, 9, 8, 2, 4, 5, 7,
             2, 9, 5, 4, 7, 1, 6, 8, 3,
             4, 8, 7, 5, 6, 3, 1, 9, 2,
             7, 5, 1, 2, 9, 4, 3, 6, 8,
             8, 4, 9, 6, 3, 5, 7, 2, 1,
             6, 2, 3, 7, 1, 8, 9, 4, 5,
             9, 1, 8, 3, 2, 6, 5, 7, 4,
             5, 6, 2, 1, 4, 7, 8, 3, 9,
             3, 7, 4, 8, 5, 9, 2, 1, 6]

    @board = Sudoku::Board.new(board)
    @tile_index = [4, 1]
    @tile = @board.matrix[*@tile_index]
  end

  class GetTile < Sudoku::BoardTest
    def test_gets_tile_for_index
      assert_equal @tile, @board.get_tile(4, 1)
    end
  end

  class GetRowForTile < Sudoku::BoardTest
    def test_returns_the_correct_row
      expected = @board.matrix.row(@tile_index.first).to_a
      row = @board.get_row_for_tile(@tile)

      assert_equal expected, row
    end
  end

  class GetColumnForTile < Sudoku::BoardTest
    def test_returns_the_correct_column
      expected = @board.matrix.column(@tile_index[1]).to_a
      column = @board.get_column_for_tile(@tile)

      assert_equal expected, column
    end
  end

  class GetSquareForTile < Sudoku::BoardTest
    def test_returns_the_correct_square
      expected = @board.matrix.minor((3..5), (0..2)).to_a.flatten
      square = @board.get_square_for_tile(@tile)

      assert_equal expected, square
    end
  end
end
