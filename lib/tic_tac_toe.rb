def display_board(board)
  puts(" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts("-----------")
  puts(" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts("-----------")
  puts(" #{board[6]} | #{board[7]} | #{board[8]} ")
end

def input_to_index(user_input)
   user_input.to_i-1
end

def move(array,index,value)
array[index] = value
end

def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || (board[index] == "X" && board[index]=="O")
      false
    elsif board[index] == "X" || board[index] == "O"
      true
    end
end

def valid_move?(board,index)
  if !index.between?(0,8)
    return false
  end
  if position_taken?(board,index)
    false
  else
    true
  end
end

def turn(board)
  is_move_valid = false
  until  is_move_valid == true
    puts "Please enter 1-9:"
    user_input=gets.chomp
    user_input=input_to_index(user_input)
    is_move_valid = valid_move?(board,user_input)
  end
  move(board,user_input,current_player(board))
  display_board(board)
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
           return win_combination
        end
  end
  return false
end

def full?(board)
  return board.all?{|element| element=="X" || element=="O"}
end

def draw?(board)
    if full?(board)
      (won?(board).class==Array)?false:true
    else
      false
    end
end

def over?(board)
     won?(board) || draw?(board)
end

def winner(board)
   if(won?(board).class==Array)
     win_indexes=won?(board)
     a_winning_index=win_indexes[0]
     return board[a_winning_index]
   else
     nil
   end
end


def turn_count(board)
  counter = 0
  board.each do |position|
    if (position == "X" || position == "O")
      counter += 1
    end
  end
  return counter
end


def current_player(board)
 turn_count(board)%2 == 0?"X":"O"
end

def play(board)
  until over?(board)
    turn(board)
  end

  if winner(board)=="X"
      puts "Congratulations X!"
    elsif winner(board)=="O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
