# Where the app will be run from
Dir["./app/*.rb"].each { |file| require file }
Dir["./app/sudoku/*.rb"].each { |file| require file }
Dir["./app/sudoku/board/*.rb"].each { |file| require file }

easy_sudoku_puzzle = [nil, nil, nil, nil, nil, nil, 1, 7, nil,
                      6, nil, 4, 7, 5, nil, 8, nil, 9,
                      nil, 5, 9, nil, 3, nil, nil, nil, nil,
                      nil, nil, nil, nil, nil, nil, 6, nil, 7,
                      3, nil, 5, 1, 2, 7, 9, nil, 4,
                      4, nil, 1, nil, nil, nil, nil, nil, nil,
                      nil, nil, nil, nil, 6, nil, 2, 4, nil,
                      1, nil, 6, nil, 7, 9, 3, nil, 8, nil,
                      3, 8, nil, nil, nil, nil, nil, nil]

puzzle = Sudoku.new(easy_sudoku_puzzle)
result_board = puzzle.solve

Sudoku::BoardDisplayer.display_board(result_board)
