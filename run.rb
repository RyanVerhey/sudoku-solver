# Where the app will be run from
require 'matrix'
Dir["./app/*.rb"].each { |file| require file }
Dir["./app/sudoku/*.rb"].each { |file| require file }
Dir["./app/sudoku/board/*.rb"].each { |file| require file }

# PUzzle Link: https://www.websudoku.com/?level=1&set_id=2959290249
easy_sudoku_puzzle = [nil, nil, 6, 9, 8, 2, 4, 5, nil,
                      nil, nil, 5, 4, nil, nil, nil, nil, 3,
                      nil, nil, 7, nil, nil, nil, 1, 9, 2,
                      nil, nil, 1, 2, 9, nil, nil, nil, nil,
                      nil, 4, nil, 6, nil, 5, nil, 2, nil,
                      nil, nil, nil, nil, 1, 8, 9, nil, nil,
                      9, 1, 8, nil, nil, nil, 5, nil, nil,
                      5, nil, nil, nil, nil, 7, 8, nil, nil,
                      nil, 7, 4, 8, 5, 9, 2, nil, nil]

# expected = [1, 3, 6, 9, 8, 2, 4, 5, 7,
#             2, 9, 5, 4, 7, 1, 6, 8, 3,
#             4, 8, 7, 5, 6, 3, 1, 9, 2,
#             7, 5, 1, 2, 9, 4, 3, 6, 8,
#             8, 4, 9, 6, 3, 5, 7, 2, 1,
#             6, 2, 3, 7, 1, 8, 9, 4, 5,
#             9, 1, 8, 3, 2, 6, 5, 7, 4,
#             5, 6, 2, 1, 4, 7, 8, 3, 9,
#             3, 7, 4, 8, 5, 9, 2, 1, 6]

puzzle = Sudoku.new(easy_sudoku_puzzle)
result_board = puzzle.solve

Sudoku::BoardDisplayer.display_board(result_board)
