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
