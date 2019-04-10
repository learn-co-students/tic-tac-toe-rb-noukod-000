
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  user_input="1"
  #define index
  def input_to_index(user_input)
     return user_input.to_i - 1
  end

  #defintion of the move function
  def move(board, index, value="X")
      board[index] = value
      return board
  end
  #CHECK FOR EMPTY spaces
  def position_taken?(board, index)
    if board[index]== "X" || board[index] == "O"
      return true
    else board[index] == " " ||  board[index] == " " ||  board[index]== nil
      return false
    end
  end
  #IS # CORRECT & SPACE EMPTY?
  def valid_move?(board, index)
  	if !position_taken?(board, index) && index.between?(0, 8)
  		return true
   	else
  		return false
   	end
  end

  #function turn

def turn(board)
  puts "Please enter 1-9:"
  #get the user input
  user_input = gets.strip
  #input to index
  index = input_to_index(user_input)
  #check for validation
  if valid_move?(board, index)
  move(board, index)
  display_board(board)
   else
    turn(board)
  end
end


#definition of the function tur count
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1
  end
end
return counter
end

#definition of function current player
def current_player(board)
  if turn_count(board)%2 ==0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end

#define won method
def won?(board)

   WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
end
#Define winner method
def full?(board)
  if board.detect {|i| i == " " || i == nil}
    return false
  else
    return true
  end
end



def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner
  WIN_COMBINATIONS.detect do |element|
    if @board[element[0]] == "X" && @board[element[1]] == "X" && @board[element[2]] == "X" && @board[element[3]] == "X"
      return "X"
    elsif  @board[element[0]] == "O" && @board[element[1]] == "O" && @board[element[2]] == "O" && @board[element[3]] == "O"
      return "O"
    else
      return nil
    end
  end
  #if win_combination = won?(board)
    #board[win_combination.first]
  #end
end

#Define play method
def play(board)
  while !over?(board)
    turn(board)
  end
  if winner == "X"
    puts " Congratulations X! "
  elsif  winner == "O"
      puts " Congratulations O! "
  else
    puts "Cat's Game!"
  end
end
