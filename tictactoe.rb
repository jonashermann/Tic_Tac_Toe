#Tic Tac Toe

 class TicTacToe

  def initialize
    @board = []
    9.times{ @board << " "}
    
  end
$count = 0
#CONSTANT has global scope in ruby
#here define
$WIN_COMBINATIONS = [ [0, 1, 2],
                     [3, 4, 5],
                     [6, 7, 8],
                     [0, 3, 6],
                     [1, 4, 7],
                     [2, 5, 8],
                     [0, 4, 8],
                     [2, 4, 6] ]
                          
def display_board
puts"#{@board[0]} | #{@board[1]} | #{@board[2]}"
puts"-----------"
puts"#{@board[3]} | #{@board[4]} | #{@board[5]}"
puts"-----------"
puts"#{@board[6]} | #{@board[7]} | #{@board[8]}" 	
end

#valid_move?()and position_taken?()
#2 methods to handle Validation.
def valid_move?(position)
	if position_taken?(position) == false && (position >= 1 && position <= 9)
       return true
   else 
       return false       
	end 

end

def position_taken?(position)
  if @board[position-1] != 'X' && @board[position-1] != 'O'
      return false
  else    
      return true
  end
end

def move(position, token)
@board[position-1] = token
 return @board
end

def turn
  $count = 0
  turn_count
	token = current_player
	puts"enter a position between 1-9"
	p = gets.chomp.to_i
    if valid_move?(p)
      
       t = token
#controle du token       
       
       move(p, t)
       
      display_board
     else
    	turn
    end
end    
#method turn calls turn, this is 
#Recursion(==repetition until condition)                 
end
public
def play
  until over? 
    turn
  end  
  if won?
    puts"congratulations! #{winner}"
  elsif draw?
      puts"DRAW!"
  end
end

def turn_count
	@board.each do |t|
		if t == 'X' || t == 'O'
			$count += 1
		end	
	end
return $count	
end
def current_player
	if $count.even?
    puts"X's turn"
		 return 'X'
	end
	if $count.odd?
    puts"O's turn"
	    return'O'
	end    	  	
end
#won? needs $board 
def won?
x = true
 $WIN_COMBINATIONS.each do |win_array| 
               win_index_1 = win_array[0]
               win_index_2 = win_array[1]
               win_index_3 = win_array[2]
              
           if @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X"
                    return [win_index_1+1, win_index_2+1, win_index_3+1]
                         
           elsif @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"

                     return [win_index_1+1, win_index_2+1, win_index_3+1]
                      
           else
                       x = false
           end             
    end 

    if  x == false
      return false 
     end  
end
def full?
  x = 0
(1..9).each do |p|
      if position_taken?(p) == false
          return false
      else
             x += 1
      end       
end
if x == 9
  return true
end
end

def draw?
   if full? && won? == false
       return true
   elsif full? == false && won? == false
        return false
   elsif won?.is_a? Array    
        return false    
   else
         return false     
   end 
end
def over?
  if won?.is_a? Array
        return true
  elsif draw?
        return true
  elsif full?
        return true     
  else
        return false
  end     
end 


def winner
  win_array =[]
  if won?.is_a? Array
          win_array = won?
       i = win_array[0]
       t = @board[i - 1]
       puts "#{t} has won the game"
  end     

end
#instructions to play
#a new tictactoe object(instance of TicTacToe)

#I made play method public 
# to fix an cute issue 
#due to fact that he uses 
#some more helpers that made him 
#private as Ruby returns
=begin
play the game on IRB with these commands
1.load "tictactoe.rb" (in working directory)
2.create a new tictactoe(tictactoe = TicTacToe.new)
3.tictactoe.display_board(show the board of the new tictactoe)
4.tictactoe.play(play the game)
=end
# other possibility to start game
=begin
for bash execution
Here in this file
1. t = TicTacToe.new
2. t.display_board
3. t.play     
=end