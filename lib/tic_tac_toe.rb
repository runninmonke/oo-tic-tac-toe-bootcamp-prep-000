class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def taken?(value)
    value != " " && value != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count()
    count = 0
    @board.each do |location|
      if taken?(location)
        count += 1
      end
    end
    count
  end

  def current_player()
    if turn_count() == 0 || turn_count()%2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  # Define your play method below
  def play
    counter = 0
    until over?()
      turn()
    end

    if won?()
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end

  end

  def won?
    WIN_COMBINATIONS.detect { |combo| combo.all? { |index| @board[index] == "X" } || combo.all? { |index| @board[index] == "O" } }
  end

  def full?
    @board.all? { |index| index == "X" || index == "O" }
  end

  def draw?
    full?() && !won?()
  end

  def over?
    won?() || full?() || draw?()
  end

  def winner
    win = won?()
    if win
      win = @board[win[0]]
    end
  end
end
