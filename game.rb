require "./grid.rb"
require "./player.rb"

class Game
	def initialize
		print "Enter name player1: "
		@p1 = Player.new gets.chomp,"x"
		print "Enter name player2: "
		@p2 = Player.new gets.chomp,"o"
	end

	def start
		@active = [@p1,@p2].sample
		until game_over?
			print "It's #{@active.name}'s turn: "
			switch_turn
			gets.chomp
		end
	end

	def game_over?
		false
	end

	def switch_turn 
		if(@active == @p1) 
			@active = @p2
		else
			@active = @p1
		end
	end
end

# Entry point for the program -> Game
Game.new.start