# Where tests will be run from
require './requires.rb'
require "minitest/autorun"
Dir["./test/*_test.rb"].each { |file| require file }
Dir["./test/sudoku/*_test.rb"].each { |file| require file }
Dir["./test/sudoku/board/*_test.rb"].each { |file| require file }
