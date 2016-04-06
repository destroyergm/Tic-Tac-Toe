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

		# check verticals
		matrix_trans.each do |array|
			puts array.join("")
			if array.join("") =~ /x{3}|o{3}/
				return true
			end
		end
		# check diagonals
		return true if diagonal_main.join("") =~ /x{3}|o{3}/
		return true if diagonal_other.join("") =~ /x{3}|o{3}/

		false
	end

	def render
		system "clear"
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

	private
	def matrix_trans
		mat = Array.new(3) { |i| Array.new }
		for i in (0..2)
			for j in (0..2)
				mat[j][i] = @board[i][j]
			end
		end
		mat
	end

	def diagonal_main
		d = Array.new(3)
			d[0] = @board[0][0]
			d[1] = @board[1][1]
			d[2] = @board[2][2]
		d
	end

	def diagonal_other
		d = Array.new(3)
			d[0] = @board[2][0]
			d[1] = @board[1][1]
			d[2] = @board[0][2]
		d
	end
end
