
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
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
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

  def position_taken?(array, ind)

if array[ind] == " " || array[ind] == ""  || array[ind] == nil

  return false

  else

    return true

  end

end


def turn (board)

 puts "Please enter 1-9:"

num = gets.chomp

index = input_to_index(num)

if valid_move?(board, index) == true

  move(board, index)

  display_board(board)

else

  turn(board)

  end

end


def turn_count(board)

  count = 0

  board.each do |play|

if play == "X" || play == "O"

  count += 1

  end

end

  return count

end



def current_player(board)

  count = turn_count(board)

  if count % 2 == 0

    return "X"

  else

    return "O"

  end

end


def won?(board)

  WIN_COMBINATIONS.each {|win_combination|

# win_combination is a 3 element array of indexes that compose a win, [0,1,2]

# grab each index from the win_combination that composes a win.

win_index_1 = win_combination[0]

win_index_2 = win_combination[1]

win_index_3 = win_combination[2]


position_1 = board[win_index_1] # load the value of the board at win_index_1

position_2 = board[win_index_2] # load the value of the board at win_index_2

position_3 = board[win_index_3] # load the value of the board at win_index_3



if position_1 == "X" && position_2 == "X" && position_3 == "X"

  return win_combination # return the win_combination indexes that won.

  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"

    return win_combination

  end

}

return
false

end




def full?(board)

  board.all?{|index| index== "X" || index == "O"}

end



def draw?(board)

  if !won?(board) && full?(board)

return true

elsif !won?(board) && !full?(board) || !won?(board)

  return false

  end

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

  def play(board)
  play = 0
  input = gets
  until over?(board)
  turn(board)
end
  if won?(board)
  winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
  puts "Cat's Game!"
end
end
