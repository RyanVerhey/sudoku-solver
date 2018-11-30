# Where the app will be run from
Dir["./app/*.rb"].each { |file| require file }
Dir["./app/sudoku/*.rb"].each { |file| require file }
Dir["./app/sudoku/board/*.rb"].each { |file| require file }
