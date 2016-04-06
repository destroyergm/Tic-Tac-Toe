class Grid

	def initialize
		@board = Array.new(3) { |i| Array.new }
		for i in (0..2)
			for j in (0..2)
				@board[i][j] = ' '
			end
		end
	end

	def render
		@board.each_with_index do |i,index_i|
			10.times {print " "} # offset to center
			i.each_with_index do |j,index_j|
				print j.center(4)
				print "|" unless index_j == 2
			end
			puts
			10.times {print " "} # offset to center
			puts "-----------".center(14) unless index_i == 2
		end
		puts
	end
end