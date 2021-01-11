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

# Returns number of turns that have been played
def turn_count (board)
  counter = 0
  board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
  end
  counter
end

# uses #turn_count to detmine if X turn or O turn
def current_player (board)
  turn_count(board).even? ? "X" : "O"
end

# single turn logic.
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip                     # get input
  index = input_to_index(input)          # convert input to index
  if valid_move?(board, index) == true   # if index is valid
      move(board, index)                   # make the move for input
      puts display_board(board)            # display board after move
  else                                   #else
    turn(board)                            #  ask for input again until given valid input (loop back to top)
  end
end

# returns false if no win combo is present on the board & reutrn winning index array [0,1,2]
def won?(board)
 WIN_COMBINATIONS.find do |win_combination| #  find first win combo in WIN_COMBINATIONS
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    win_index_1 = win_combination[0] # grab each index from the win_combination that composes a win. [left]
    win_index_2 = win_combination[1] # grab each index from the win_combination that composes a win. [middle]
    win_index_3 = win_combination[2] # grab each index from the win_combination that composes a win. [right]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination # return the win_combination indexes that won.
      else
        false
      end
  end
end
