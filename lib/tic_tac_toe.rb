def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def input_to_index input
  input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn board
  puts "Please choose your move between 1-9"

  input = gets.strip

  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, (current_player board))
    display_board(board)
  else
    turn board
  end
end

def turn_count board
  x_arrays = board.select do |cell|
    cell == 'X'
  end

  o_arrays = board.select do |cell|
    cell == 'O'
  end

  x_arrays.size + o_arrays.size
end

def won? board
  if board.all?{|cell| cell == "" || cell == " "}
    false
  else
    row_win = nil
    WIN_COMBINATIONS.each do |win_combination|
      if (board[win_combination[0]] == board[win_combination[1]] &&
        board[win_combination[0]] == board[win_combination[2]] &&
        board[win_combination[0]] == 'X') ||
        (board[win_combination[0]] == board[win_combination[1]] &&
          board[win_combination[0]] == board[win_combination[2]] &&
          board[win_combination[0]] == 'O')
        row_win = win_combination
      end
    end
    return row_win
  end

  false
end

def full? board
  x_arrays = board.select do |cell|
    cell == 'X'
  end

  o_arrays = board.select do |cell|
    cell == 'O'
  end

  (x_arrays.size + o_arrays.size) == 9
end

def draw? board
  # if (!(won? board)) && (full? board)
  #   return true
  # end
  #
  # if (!(won? board)) && (!full? board)
  #   return false
  # end
  #
  # if (won? board)
  #   return false
  # end
  if (full? board)
    if won? board
      false
    else
      true
    end
  else
    false
  end
end

def over? board
  (won? board) || (full? board) || (draw? board)
end

def winner board
  x_arrays = board.select do |cell|
    cell == 'X'
  end

  o_arrays = board.select do |cell|
    cell == 'O'
  end

  if x_arrays.size > o_arrays.size
    return 'X'
  elsif x_arrays.size < o_arrays.size
    return 'O'
  else
    return nil
  end
end

def current_player board
  count = turn_count board

  if count == 0
    'X'
  end

  count.even? ? 'X' : 'O'
end

def play board
  until over? board
    turn board
  end

  if won? board
    puts "Congratulations #{winner board}!"
  elsif draw? board
    puts "Cat's Game!"
  end
end
