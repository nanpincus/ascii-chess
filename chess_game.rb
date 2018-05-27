# Simulate an ASCII chess game

chess_board = [
	["8|", "r","n","b","q","k","b","n","r"],
	["7|", "p","p","p","p","p","p","p","p"],
	["6|", ".",".",".",".",".",".",".","."],
	["5|", ".",".",".",".",".",".",".","."],
	["4|", ".",".",".",".",".",".",".","."],
	["3|", ".",".",".",".",".",".",".","."],
	["2|", "P","P","P","P","P","P","P","P"],
	["1|", "R","N","B","Q","K","B","N","R"],
	[" -", "-","-","-","-","-","-","-","-"],
	["  ", "a","b","c","d","e","f","g","h"]
]

def convert_chess_column_to_index(column)
	chess_board_columns_hash = {
		"a" => 1,
		"b" => 2,
		"c" => 3,
		"d" => 4,
		"e" => 5,
		"f" => 6,
		"g" => 7,
		"h" => 8
	}
	chess_board_columns_hash[column]
end

# To get the correct row, we have to calculate the inverse of a traditional chess move (row 2 becomes row 6)
# to match the user expectation that the rows are indexed from the bottom of the board, rather than the top
# of the board as in our two-dimensional array
def process_row(position)
	8 - Integer(position[1])
end

# Convert each column (a letter from a to h) to a corresponding index in our two-dimensional array
def process_column(position)
	convert_chess_column_to_index(position[0])
end

# Get a chess-board that shows the result of the move
def process_move(chess_board, start_position, end_position)
	# Capture the piece at the start position
	start_position_piece = chess_board[process_row(start_position)][process_column(start_position)]

	# Move the piece at the start position to the end position
	chess_board[process_row(end_position)][process_column(end_position)] = start_position_piece
	# Replace the start position with an empty space
	chess_board[process_row(start_position)][process_column(start_position)] = "."

	chess_board
	
end

def is_user_input_valid?(position)
	# A single position should be of the format ["e", 4]
	if position.length != 2
		puts "Input error: please make sure your move is in the bounds of the board in the correct format."
		false
	# The column can't be outside of the board
	elsif not ("a".."h").include?(position[0])
		puts "Input error: please make sure your move is in the bounds of the board in the correct format."
		false
	# The row can't be outside of the board
	elsif Integer(position[1]) > 8
		puts "Input error: please make sure your move is in the bounds of the board in the correct format."
		false
	else
		true
	end

end

# TODO: Add in logic to handle piece-specific movement restrictions
def is_move_valid?(chess_board, start_position, end_position, whose_turn)
	# Capture the piece at the start position
	start_position_piece = chess_board[process_row(start_position)][process_column(start_position)]

	if start_position_piece == "."
		puts "Cannot move from where there is no piece!"
		false
	elsif piece_is_white?(start_position_piece) and whose_turn == :black
		puts "Invalid move: It's black's turn and you're trying to move white's piece!"
		false
	elsif piece_is_black?(start_position_piece) and whose_turn == :white
		puts "Invalid move: It's white's turn and you're trying to move black's piece!"
		false
	else
		true
	end
end

# White pieces are capitalized in this game
def piece_is_white?(piece)
	piece === piece.capitalize
end

# Black pieces are lowercase in this game
def piece_is_black?(piece)
	piece === piece.downcase
end

# Clear the terminal screen to clean up the display
	system "clear" or system "cls"

whose_turn = :white
while true

	# Print current state of chessboard
	chess_board.each { |x|
 		puts x.join(" ")
	}

	puts "Submit the next move in the following format: <current_column><current_row> <target_column><target_row>, "\
		"or \"e2 e4\" to move the white King's pawn forward two spaces. To quit, type \"Quit\"."

	# If the user chooses to quit, break out of the loop, else process the move
	user_input = gets
	break if user_input.chomp.downcase=="quit"

	processed_input = user_input.split(' ')

	# Clear the terminal screen to clean up the display
	system "clear" or system "cls"

	start_position = processed_input[0]
	end_position = processed_input[1]

	if !(is_user_input_valid?(start_position) and is_user_input_valid?(end_position))
		# Do nothing
	elsif !is_move_valid?(chess_board, start_position, end_position, whose_turn)
		# Do nothing
	else
		puts "You entered #{start_position} #{end_position}"
		chess_board = process_move(chess_board, start_position, end_position)

		# Flip whose turn it is upon a valid move
		if whose_turn == :white 
			whose_turn = :black 
		else 
			whose_turn = :white
		end
	end

	
end

