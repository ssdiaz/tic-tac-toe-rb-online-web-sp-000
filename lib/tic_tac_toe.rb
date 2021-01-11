# possible win combinations
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

def display_board(board) # prints current board representation
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input) # converts user input to represent on board's index
  user_input.to_i - 1
end

def position_taken?(board, index) # returns true if position is taken, & false if position is free
  board[index] != " "
end

def valid_move?(board, index) # true if move is valid, as in: 1. input index between 0-8, 2. space is free/not taken
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn_count (board) # returns number of turns that have been played
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
end

def current_player (board) # determines if X turn (evens) or O turn (odd)
  turn_count(board).even? ? "X" : "O"
end

def move(board, index, current_player) # move sets index to current player's token
  board[index] = current_player
end

def turn(board) # represents a single turn move
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

def full?(board) # accept a board and return true if every element in the board contains either X or O
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)   # returns true if board not won but full for a draw
  !won?(board) && full?(board)
  end

def over?(board) # true if won, draw, or full for game to be over (don't need full as this is actioned in #draw?)
  won?(board) || draw?(board) # || full?(board)
end

def winner(board) # returns the player token that won
  if won?(board)
   board[won?(board)[0]] # use first index of winning board and display it from board
  end
end

def play(board) # play method, loops the game until over and gives outcome
  until over?(board)
    turn(board)
  end

    if won?(board)
     puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
     puts "Cat's Game!"
   end
end
