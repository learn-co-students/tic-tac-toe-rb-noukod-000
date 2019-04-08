board=[" "," "," "," "," "," "," "," "," "] #empty board

#method to display the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
 
end

# all 8 possible WIN_COMBINATIONS
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
          

 #set user input into array index       
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  
  #method to verify if a position is free or taken
def position_taken?(board,index) 
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board [index] == nil 
    false
  end   
end

  #method to verify the user input is valid
def valid_move?(board,index)
   if position_taken?(board,index) == false && index.between?(0,8)
     true
   end 
 end


#put user input on the board
def move(board, index, value)
    board[index] = value
  end
  
#count the count
 def turn_count(board)
   numP = 0 
   board.each do |el|
     if el == "X" || el == "O"
       numP += 1 
     end 
     
   end 
   return numP
 end
 
 
  #determine the curreng player
  def current_player(board)
    if turn_count(board) == 0
      return "X"
    elsif
      turn_count(board) % 2 == 0 
      return "X"
    else
      return "O"
    end 
  end


 #make the action after verifying 
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


  #verify whether the game is won 
    def  won?(board)
       
       WIN_COMBINATIONS.each {|i|
          #get win combinations at each loops
        win_1= i[0]
        win_2 = i[1]
        win_3 = i[2]
          
          
        pos_1 = board[win_1]
        pos_2 = board[win_2]
        pos_3 = board[win_3]
        
        if(pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
          return i
        elsif (pos_1 == "X" && pos_2 == "X" && pos_3 == "X")
          return i
        end
         }
         return false
   end 
    
    #verify if board is full
    def full?(board)
     !(board.include?(" "))
    end
    
    
    #verify draw
    def draw?(board)
      if !won?(board) && full?(board)
        return true
      else 
        return false
      end
    end
    
          #verify is the game is over
    def over?(board)
      
      if draw?(board) || won?(board) || full?(board)
        return true
      else
        return false
      end
      
    end
    
    
    #get who's the winner
    def winner(board)
      save = won?(board)
      if save == false
        return nil
      end
      if board[save[0]] == "X"
        return "X"
      elsif board[save[0]] == "O"
        return "O"
      end
    end
    
    
    # main method
def play(board)
  while !over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else  puts "Cat's Game!"
end
end
