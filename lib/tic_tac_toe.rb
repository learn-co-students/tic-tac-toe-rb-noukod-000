

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
index =  user_input.to_i
  index -= 1
  return index
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(array, index)
  if (array[index] == " " || array[index] == "" || array[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0,8)
    if position_taken?(board, index)
      false
    else
      true
    end
  else
    false
  end
end

def turn (board)
  move_valid = false
    until move_valid == true
      puts "Please enter 1-9:"
      index = input_to_index(gets.chomp)
      move_valid = valid_move?(board,index)
    end
    move(board, index, current_player(board))
    display_board(board)
end

def full?(board)
	board.all?{|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
    return false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner (board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def turn_count board
counter = 0
board.each do |num|

  if (num == "X" || num =="O")
    counter = counter + 1
  end
end
return counter
end

def current_player(board)
  turn_count(board)%2 == 0? "X" : "O"
end

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1] # load the value of the board at win_index_1
        position_2 = board[win_index_2] # load the value of the board at win_index_2
        position_3 = board[win_index_3] # load the value of the board at win_index_3

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
           return win_combination # return the win_combination indexes that won.
        end
  end
  return false
end


def play(board)
until over?(board)
  turn(board)
end
if winner(board) == "X"
  puts "Congratulations X!"
elsif winner(board) =="O"
  puts "Congratulations O!"
else
  puts "Cat's Game!"
end
end
