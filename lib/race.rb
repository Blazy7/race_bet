module RaceBet
  class Race

    class << self
      def score(guesses, winners)
        score = 0

        guesses.each_with_index do |guess, index|
          if correct_guess?(guess, winners, index)
            score += get_points(index)
          elsif guess_in_top_five?(guess, winners, index)
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

      def correct_guess?(guess, winners, index)
        winners.index(guess) == index
      end

      def guess_in_top_five?(guess, winners, index)
        index < 5 && winners.first(5).include?(guess)
      end
    end
  end
end
