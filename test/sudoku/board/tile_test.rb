class Sudoku::Board::TileTest < MiniTest::Test
  def setup
    @tile = Sudoku::Board::Tile.new(5)
    @empty_tile = Sudoku::Board::Tile.new(nil)
  end

  class ValueEquals < Sudoku::Board::TileTest
    def test_raises_an_error_if_the_tile_has_a_value
      assert_raises ArgumentError do
        @tile.value = 6
      end

      # Nothing happens
      assert @empty_tile.value = 6
    end

    def test_sets_the_new_value
      @empty_tile.value = 6
      assert_equal 6, @empty_tile.value
    end

    def test_resets_the_tiles_possibilities
      @empty_tile.possibilities += (1..5).to_a
      @empty_tile.value = 6
      assert @empty_tile.possibilities.empty?
    end
  end

  class Empty < Sudoku::Board::TileTest
    def test_returns_whether_or_not_the_tile_is_empty
      refute @tile.empty?
      assert @empty_tile.empty?
    end
  end
end
