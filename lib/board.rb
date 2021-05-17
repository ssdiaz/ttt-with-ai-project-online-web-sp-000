class Board

  attr_accessor :cells
  # @cells = [] #stores all data of the state of board in an array // not needed here since defined in attr_accessor

  def initialize
    reset! # need to reset and create the board
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    #print it's current state
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    # takes UI from string of 1-9 strings & looks up cell per array's perspective.
    # other methods will take UI and use position to look up value according to arrays cells index
    @cells[user_input.to_i - 1]
  end

  def turn_count
    #how many positions in the cells are filled tells you whos turn it is
    @cells.count {|space| space == "X" || space == "O"}
  end

  def taken?(user_input)
    #t/f for an individual position
    position = user_input.to_i-1
    @cells[position] == "X" || @cells[position] == "O"
  end

  def valid_move?(user_input)
    #ensures that user chooses moves b/w 1-9 and position not taken
    #user_input.to_i.between?(1,9) && taken?(user_input) == false
    user_input.to_i.between?(1,9) && !taken?(user_input)
  end

  def full?
    #entirely X or Os // return true if all positions filled
    turn_count == 9
    # or: use if statement on cells.all? {|position| position == "X" || position == "O"}
  end

  def update(user_input, player_object)
    #updates the board when a player makes a move
    @cells[user_input.to_i - 1] = player_object.token # need to call token method
  end

end

# learn spec/01_board_spec.rb
