
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  # An empty board set up
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

  # user input considering the board' array begins with zero (1-1)
def input_to_index(input)
    input.to_i - 1
end
# player moves
def move(board, index, player_token)
  board[index] = player_token
end

#check for taken position on the board
def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    false
  else
    true
  end
end

#check if the player move is valid
def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  i = gets.strip
  index = input_to_index(i)
  K = valid_move?(board, index)
  if K == true
    move(board, index, player_token)
  else K == false
    until K == true
    puts "This is an invalid move. Please enter 1-9:"
    i = gets.strip
    index = input_to_index(i)
    K = valid_move?(board, index)
    move(board, index, player_token)
  end
end
display_board(board)
end
