class Sudoku::BoardTest < MiniTest::Test
  def setup
    board = [nil, nil, 6, 9, 8, 2, 4, 5, nil,
             nil, nil, 5, 4, nil, nil, nil, nil, 3,
             nil, nil, 7, nil, nil, nil, 1, 9, 2,
             nil, nil, 1, 2, 9, nil, nil, nil, nil,
             nil, 4, nil, 6, nil, 5, nil, 2, nil,
             nil, nil, nil, nil, 1, 8, 9, nil, nil,
             9, 1, 8, nil, nil, nil, 5, nil, nil,
             5, nil, nil, nil, nil, 7, 8, nil, nil,
             nil, 7, 4, 8, 5, 9, 2, nil, nil]

    @board = Sudoku::Board.new(board)
    @tile_index = [4, 1]
    @tile = @board.matrix[*@tile_index]
  end

  class Tiles < Sudoku::BoardTest
    def test_returns_all_of_the_boards_tiles
      expected = @board.matrix.to_a.flatten

      assert_equal expected, @board.tiles
    end
  end

  class Solved < Sudoku::BoardTest
    def test_returns_whether_the_board_is_solved
      refute @board.solved?

      solved_board = Sudoku::Board.new((1..81).to_a)
      assert solved_board.solved?
    end
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
