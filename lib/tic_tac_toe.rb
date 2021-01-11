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

# check if position is free; returns true if position is taken, & false if position is free
def position_taken?(board, index)
  board[index] != " "
end

# true if move is valid: 1. input index between 0-8 2. space is not taken (is free)
def valid_move?(board, index) #  index.between?(0,8) && !position_taken?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
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

# sets index to current player's token
def move(board, index, current_player)
  board[index] = current_player
end

# represents a single turn move
def turn(board)
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def won?(board) # return winning combo index, or false if no win combo
 WIN_COMBINATIONS.find do |winning_combo| # find first winning_combo in board (array of 3, ex: [0,1,2]) in WIN_COMBINATIONS
    #if (board[winning_combo[0]] == "X" && board[winning_combo[1]] == "X" && board[winning_combo[2]]  == "X") || (board[winning_combo[0]] == "O" && board[winning_combo[1]] == "O" && board[winning_combo[2]]  == "O")
    if board[winning_combo[0]] == board[winning_combo[1]] && board[winning_combo[1]] == board[winning_combo[2]] &&
        position_taken?(board, winning_combo[0])
          winning_combo # return the winning_combo (array) that won the game
    end
  end
end

def full?(board) # accept a board and return true if every element in the board contains either x or o
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)   # returns true if board not won but full
  !won?(board) && full?(board)
  end

def over?(board) # true if won, draw, or full
  won?(board) || draw?(board) || full?(board)
end

def winner(board) # returns the token that won
  if won?(board)
   board[won?(board)[0]] # find first index of winning board and display it from board
  end
end

# play method, responsi for game loop,
def play(board)
  input = gets
  until won?(board) || draw?(board)#  until the game is over
    turn(board) #take turns
  end
#
    if won?(board)#  if the game was won
     puts "Congratulations #{winner(board)}!" # congratulate the winner
   elsif draw?(board)       #  else if the game was a draw
     puts "Cat's Game!"     #    tell the players it has been a draw
   end
end
