#code helper methods here

# Define your WIN_COMBINATIONS constant
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

# empty board
board_empty = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# prints current board played
def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# takes user input and converts (sub -1) to fit board index
def input_to_index (user_input)
  user_input.to_i - 1
end

# determines player's move
def move (board, index, player_token)
  board[index] = player_token
end

# evaluates if position selcted by user is not taken.
# If position free, returns false. If position taken, return true
def position_taken? (board, index)
  if board[index] == " " || board[index] ==  "" || board[index] == nil
    board[index] = false
  else
    board[index] = true
  end
end

# Returns true if move is valid, and false if move is nil or invalid.
# A valid position is: 1. present on the board, 2. not aleady taken
def valid_move?(board, index)
  if !position_taken?(board,index) && index.between?(0,8)
    true
  else
    false
  end
end
