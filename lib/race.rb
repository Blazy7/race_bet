module RaceBet
  class Race

    class << self
      def score(guesses, winners)
        score = 0

        guesses.each_with_index do |guess, index|
          #check if guess is at the right place
          if winners.index(guess) == index
            score += get_points(index)
          #check if guess is at top five
          elsif index < 5 && winners[0..4].include?(guess)
            score += 1
          end
        end

        score
      end

      def get_points(index)
        place = index + 1

        case place
        when 1 then 15
        when 2 then 10
        when 3 then 5
        when 4 then 3
        when 5 then 1
        end
      end
    end
  end
end
