# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [2,4,6],  # Diagonal 1
  [0,4,8],  # diagonal 2
  [0,3,6],  # left
  [1,4,7],  # Middle
  [2,5,8]  # right
]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do|index|
    if (index == "X" or index == "O")
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
   if board.all? {|index| index == " "  }
     false
   else
     WIN_COMBINATIONS.each do |win_combination|

        win_array  = win_combination.select {|index| (board[index] == "X")}
        win_array2 = win_combination.select {|index| (board[index] == "O")}
        if win_array.length == 3
          return win_array
        end
        if win_array2.length == 3
         return win_array2
        end

      end
      return false
   end
end
#full? retur true if board contains only X or O
def full?(board)
  board.all? {|position| position == "X" or position == "O"}
end

def  draw?(board)
  if won?(board) == false and full?(board)
    return true
  else
    return false
  end
end
#over? return true if the game is draw or if is won
def over?(board)
   if draw?(board) == true or won?(board) != false
     return true
   end
end

def winner(board)
  array = won?(board)
  if array != false
    if board[array[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

#play
def play(board)
  #input = gets
  until over?(board) == true
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
