def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
<<<<<<< HEAD
    move(board, index, a_value)
=======
    move(board, index, a_value = "X")
>>>>>>> 4df41e3a77420bac220768ce341a59b3a3e06c17
    display_board(board)
  else
    turn(board)
  end
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  return user_input.to_i - 1
end

<<<<<<< HEAD
def move(board, user_index, a_value = "X")
=======
def move(board, user_index, a_value)
>>>>>>> 4df41e3a77420bac220768ce341a59b3a3e06c17
  board[user_index] = a_value
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def play(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, a_value)
    display_board(board)
    while over?(board) = false
      turn(board)
    end
    if over?(board)
      puts "Game is over"
    end
  loop_counter = 1
  while loop_counter <= 9
    turn(board)
    loop_counter += 1
  end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  return counter
end

  def current_player(board)
    if turn_count(board) % 2 == 1
      return "O"
    else
      return "X"
    end
  end

  # Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top rows
  [3,4,5], # middle rows
  [6,7,8], # bottom rows
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left diagonal
  [2,4,6]  # right diagonal

]

def won?(board)
  if board.all?{|cell| cell == "" || cell == " "}
    false
  else
    row_win = nil
    WIN_COMBINATIONS.each do |combinations|
      if combinations.all?{|cell| board[cell] == "X"} || combinations.all?{|cell| board[cell] == "O"}
        row_win = combinations
      end
    end
  end
  return row_win
end

def full?(board)
  board_full = board.all?{|cell| cell == "X" || cell == "O"}
end

def draw?(board)
  board_draw = (!won?(board) && full?(board))
end

def over?(board)
  game_over = (won?(board)) || (full?(board)) || (draw?(board))
end

def winner(board)
  game_winner = nil
  if won?(board)
    WIN_COMBINATIONS.each do |combinations|
      if combinations.all?{|cell| board[cell] == "X"}
        game_winner = "X"
      elsif combinations.all?{|cell| board[cell] == "O"}
        game_winner = "O"
      end
    end
  end
  return game_winner
end
