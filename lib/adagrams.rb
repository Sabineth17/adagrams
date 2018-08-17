require "pry"

def draw_letters
  letters = %W[A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T T T T U U U U V V W W X Y Y Z]
  hand = []
  10.times do
    index = rand(letters.length)
    hand << letters.delete_at(index)
  end
  return hand
end





def uses_available_letters?(input,letters_in_hand)
  # binding.pry
  input.split("").each do |letter|
    if letters_in_hand.include?(letter)
      # binding.pry
      letters_in_hand.each_with_index do |hand_letter,index|
        if hand_letter == letter
          letters_in_hand.delete_at(index)
          break
        end

        # index.delete_at(index)
      end
    elsif !letters_in_hand.include?(letter)
      return false
      # binding.pry
    end
  end
  # binding.pry
  return true
end



def score_word(word)
  score = 0

  if word.length >= 7
    score = 8
  end

  word.split("").each do |letter|

    case letter.upcase
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      score += 1
    when "D", "G"
      score += 2
    when "B", "C", "M", "P"
      score += 3
    when "F","H","V","W","Y"
      score += 4
    when "K"
      score += 5
    when "J","X"
      score += 8
    when "Q","Z"
      score += 10
    else
      puts "Invalid word score: #{word}"
    end
  end
  # binding.pry
  return score

end

def highest_score_from(words)
  # convert from array of string into array of hashes

  high = {score: 0, word: "A"}

  words.each do |word|
    score = score_word(word)

    # if score == high[:score] && word.length == 10
    if word.length == 10
      # words.each do |a,b|
      # if a.size < b.size
      high[:score] = score_word(word)
      high[:word] = word
      break
    elsif score == high[:score] && word.length < high[:word].length
      high[:score] = score_word(word)
      high[:word] = word
      # elsif a.size == 10 || b.size == 10
      #   high[:score] = score_word(word)
      #   high[:word] = word
    elsif score > high[:score] && word.length < 10
        high[:score] = score_word(word)
        high[:word] = word
    end
  end
# binding.pry
# high.max_by

# end
return high

end
