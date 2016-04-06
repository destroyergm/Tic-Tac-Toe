class Grid

	def initialize
		@board = Array.new(3) { |i| Array.new }
		for i in (0..2)
			for j in (0..2)
				@board[i][j] = ' '
			end
		end
	end

	def put_piece(index, piece)
		x = (index / 3)
		y = (index % 3)
		return nil if index > 8
		return nil if index < 0
		if (@board[x][y] != ' ')
			return nil
		end
		@board[x][y] = piece
		@last_piece = piece;
		true
	end

	def finished?
		# check horizontals
		@board.each do |array|
			if array.join("") =~ /x{3}|o{3}/
				return true
			end
		end

		# check verticals TODO: Finish vertivals and diagonals
		@board.each do |array|
			arr = []
			array.each_with_index {|i,elem| arr << elem if i == 0}
			puts arr.join("")
		end

		# check diagonals
		false
	end

	def render
		# system "clear"
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