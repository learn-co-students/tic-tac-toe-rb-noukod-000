
  # Define your WIN_COMBINATIONS constant
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
  
# Define your display_board here
def display_board(board)
  print " #{board[0]} | #{board[1]} | #{board[2]} "
  print "-----------"
  print " #{board[3]} | #{board[4]} | #{board[5]} "
  print "-----------"
  print " #{board[6]} | #{board[7]} | #{board[8]} " 
end

# Define your input_to_index here
def input_to_index(user_input)
   user_input.to_i - 1
end


# Define your move here
def move(board, index, current_player)
 board[index] = current_player
end

# Define your position_taken? here
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



# Define your valid_move? here
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# Define your turn here
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else 
   turn(board)
  end
end

# Define your turn_count here
def turn_count(board)
  counter = 0
  board.each do|position|
    if (position == "X") || (position == "O")
      counter += 1 
    end
  end
      return counter
end

# Define your current_player here
def current_player(board)
  (turn_count(board) % 2 == 0)? "X" : "O"
end

# Define your won? here
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    #element is each sub array in WIN_COMBINATIONS ex. [0,1,2]
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    #position_ gives you the X's and O's at the position in the board
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    position_array = [position_1,position_2,position_3]
    
    #tests to see if all of the positions in the array are O's
    choice_O = position_array.all? do|win_combination|
      win_combination == "O"
    end
    #tests to see if all of the positions in the array are X's
    choice_X = position_array.all? do|win_combination|
      win_combination == "X"
    end
      if ( (position_taken?(board,win_index_1)) && (position_taken?(board,win_index_2)) && (position_taken?(board,win_index_3)) )
        if (choice_X  || choice_O)
         return win_combination
        end
      end
  end
    return false
  
end

#code the full? method here
def full?(board)
  #return true if every element in the board contains something
  if board.detect {|i| i == " " || i == nil}
    return false
  else
    return true
  end
end


#code the draw? method here
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

#code the over? method here
def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end

#code the winner method here
def winner(board)
  #return token x or o that won the game
  
  if ( won?(board) )
    position_array = []
    (won?(board)).each do |element|
      position_array << board[element]
    end
    choice_X = position_array.all? do|element|
        element == "X"
    end
    if (choice_X )
      return "X"
    else
      return "O"
    end
  end
end
  
#code the play method here
def play(board) 
  while over?(board) == false
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end

    
