module Players
    class Computer < Player

    def move(board)
      #rand(0..10).to_s
      if board.valid_move?(4)#if first choose middle
        "4"
      #elsif
        else
        rand(0..10).to_s
      end
    end

  end
end

# learn spec/05_computer_player_spec.rb
