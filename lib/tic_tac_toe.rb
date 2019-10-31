class TicTacToe
  
  # array of possible win combinations 
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
 #assign a instance variable @board to an array of 9 blank spaces " "
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
# defines the current player
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
 # count the occupied positions
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
 #this prints the arbitrary arrangements of the board
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
 
 # this method accept the user input(a string) and converts it to an integer  
 
    def input_to_index(input)
    @input = input.to_i
    @input = @input - 1
  end

#this allows players to move 
  def move(index,token = "X")
    @board[index] = token
  end

   def position_taken?(index)
    if(@board[index] != " ")
      true
    else
      false
    end
  end

  
  
  
  
  
end




  