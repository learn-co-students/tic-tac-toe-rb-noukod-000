
# Helper Method

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

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

#the play methode

# Define your play method below
def play(board)
  counter = 0 
  position = 3
  loop do
    counter +=1
    turn(board)
    if counter >= position
    puts " your position is #{position}"
  
    end
    
  end
end


# the methiode will take a argument of the board array and return the number of turns that have played
board =[" ", " ", " ", " ", " ", " ", " ", " "," "]
def turn_count(board)
  counter = 0 
  #move_turn = []
  board.each do |element| 
    if element == "X" || element == "O"
     
      puts " element correspondant is #{element}"
      puts "the position occupied is #{counter}"
       counter += 1
    end
  end
 return counter
 
  
end

#this methode will should take in an  argument of the game board and use the turn_count to determinate if is X or turn O

def current_player(board)
  current_pla = turn_count(board)
  if current_pla %2==0
    return "X"
  else
    return "O"
  end
  
end
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],  [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],   [2,4,6]  ] #Bottom row
 #Right start diagonal   # Top row | Middle row |  #Left column |  #Left column |  #Middle |#Left start |  diagonal column |#Right column |   #Left column


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#methode which 

def won?(board)
  row_win =[]
  empty_board= board.all? {|x| x ==" "}
  WIN_COMBINATIONS.each do |row_win_position|
<<<<<<< HEAD
   # row_win_position.each do |board|
     # if empty_board || full?(board)
       # return false
      #else
      
        win_index_1 = row_win_position[0]
        win_index_2 = row_win_position[1]
        win_index_3 = row_win_position[2]
        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]
      
             if position_1 == "X" && position_2 == "X" && position_3 == "X"
               return row_win_position
             elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              return row_win_position
            
        end
      
       
        
    end
      return false
        
end
    
    
  
def full?(board)
  empty_board= board.all? {|x| x =="X" || x=="O"}
  
=======
    row_win_position.each do |position_for_win|
      if empty_board
        return false
      elsif !empty_board && position_for_win == "X"
        return position_for_win
      end
    end
    
  end
    
#     nested_students.each do |student_array|
#   student_array.each do |student_detail|
#     puts student_detail
#   end
# end
    
#     if empty_board
#       return false
#     elsif row_win_position.all? { |value| board[value] =="X" } || row_win_position.all? { |value| board[value] =="O" }
#       row_win = row_win_position
  
#     end
#   end
# end
#   return row_win
>>>>>>> a2af31052b3d5bf04b7f5462fc27a03ab2c859e6
end

def draw?(board)
 if full?(board) && !won?(board)
   return true 
 else 
   false
 end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return  true
  end
end
  
def winner(board)
 row_win = won?(board)
 if row_win == false
   return nil
 end
 if board[row_win[0]] == "X" 
   return "X"
  elsif board[row_win[0]] == "O"
  return "O"
  end
end

#the play methode

# Define your play method below
def play(board)
  counter = 0 
  position = 3
  loop do
    counter +=1
    turn(board)
    if counter >= position
    puts " your position is #{position}"
  
    end
    
  end
end


