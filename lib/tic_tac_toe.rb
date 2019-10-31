class TicTacToe
  
  # array of possible win combinations 
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  attr_accessor :game 
  
 #assign a instance variable @board to an array of 9 blank spaces " "
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    @play = play
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

# returns true/false if position is taken   
   def position_taken?(index)
    if(@board[index] != " ")
      true
    else
      false
    end
  end
  def valid_move?(index)
    if(@board[index] == " " && index>=0 && index<=8 )
      true
    else
      false
    end
  end


  def turn_count
    @count = 0
    @board.each { |e|
      if e != " "
        @count+=1
      end
    }
    @count
  end


  def current_player
    if(turn_count.even?)
      "X"
    else
      "O"
    end
  end


  def turn
    input = gets.strip
    @input_to_index = input_to_index(input)
    @valid_move = valid_move?(@input_to_index)
    @current_player = current_player


    if(@valid_move)
      move(@input_to_index,@current_player)
      display_board
    else
      puts "invalid"
      input = gets.strip
    end
  end


  def won?
    winning = []
    WIN_COMBINATIONS.each_with_index { |combination,i|
      winning[i] = []
      combination.each{ |index|
        if(@board[index] == "X") # Check if X is the winner
          winning[i] << combination
        else
          winning[i] << false
        end
      }
    }


    winning = winning.find {|e| !e.include?(false)}
    if(winning)
      winning[0]
    else # if_not, then it checks if O is the winner and show our final result
      winning = []
      WIN_COMBINATIONS.each_with_index { |combination,i|
        winning[i] = []
        combination.each{ |index|
          if(@board[index] == "O")
            winning[i] << combination
          else
            winning[i] << false
          end
        }
      }
      winning = winning.find {|e| !e.include?(false)}
      if(winning)
        winning[0]
      else
        winning
      end
    end
  end


  def full?
    @board.all? { |e| e == "X" || e == "O" }
  end


  def draw?
    if !won? && full?
     return true
   elsif !won? && !full?
     return false
   else won?
     return false
   end
  end


  def over?
    if(draw? || won? || full?)
      true
    else
      false
    end
  end


  def winner
    if(won?)
      winning = @board[won?[0]]
      if winning.include?("X")
        "X"
      elsif winning.include?("O")
        "O"
      end
    else
      nil
    end
  end


  def play
    until over?
       turn
    end
    if won?
       puts "Congratulations #{winner}!"
    elsif draw?
       puts "Cat's Game!"
    end
  end
end




  