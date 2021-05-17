class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [6,4,2]
        ]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new) #(player_1 = "X", player_2 = "O", board = []) #
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
     WIN_COMBINATIONS.find do |win_array|
      @board.cells[win_array[0]] == @board.cells[win_array[1]] &&
      @board.cells[win_array[0]] == @board.cells[win_array[2]] &&
      (@board.cells[win_array[0]] == "X" || @board.cells[win_array[0]] == "O")
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
     won? ? @board.cells[won?.first] : nil
  end

  def turn
    player = current_player
    current_move = player.move(@board)

    if @board.valid_move?(current_move)
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(current_move, player)

    else
      puts "invalid"
      self.turn
    end
  end

  def play
    puts "Player #{current_player.token}: Please make your selection."
    until self.over?
      @board.display
      self.turn
    end

    if self.won?
      @board.display
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      @board.display
      puts "Cat's Game!"
    end
  end


   def start
    puts "Greetings! Welcome to tictactoe!"
    puts "How many players are playing? Enter: 0, 1, or 2"
    answer_players = gets.strip

    if answer_players == "0"
      puts "Computer plays itself!"
      # computer game here -- need to fix

    elsif answer_players =="1"
      puts "You are playing against the computer. Do you want to go first and be player X? Enter: Y/N"
      answer2 = gets.strip

      if answer2 == "Y" ||  answer2 = "y"
         Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"),board= Board.new)
         self.play

      else
        Game.new(Players::Computer.new("X"), Players::Human.new("O"),board = Board.new)
      end

    elsif answer_players == "2"
      puts "You both are playing! Please decide who will go first as Player X."
      sleep (2)
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
      self.play
    else
      puts "I do not understand. Goodbye!"
    end
  end

 end
# learn spec/04_game_spec.rb
# ruby bin/tictactoe
