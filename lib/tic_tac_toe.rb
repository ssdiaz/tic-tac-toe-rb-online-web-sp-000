# win combinations
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Column Left vertical
  [1,4,7], # Column Middle vertical
  [2,5,8], # Column Right vertical
  [0,4,8], # Right to Left diagonal
  [2,4,6]  # Left to Right diagonal
   ]

# prints current board representation
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# converts user input to represent on board's index
def input_to_index(user_input)
  user_input.to_i - 1
end

# sets index to current player's token
def move(board, index, token)
  board[index] = player
end

# check if position is free; returns true if position is taken, & false if position is free
def position_taken?(board, index)
  board[index] != " "
end

# true if move is valid: 1. input index between 0-8 2. space is not taken (is free)
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# retuns # of turns that have been played
def turn_count (board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
end

# determines if X turn (evens) or O turn (odd)
def current_player (board)
  turn_count(board).even? ? "X" : "O"
end

# represents a single turn move
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end
