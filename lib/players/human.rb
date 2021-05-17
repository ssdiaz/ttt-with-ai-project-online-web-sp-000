module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9"
      gets.strip # don't need to set as variable per below lines. This will return.
    end

  end
end
# learn spec/03_human_player_spec.rb
