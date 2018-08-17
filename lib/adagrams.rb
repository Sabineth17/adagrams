require "pry"

#Wave 1
#method that represent the hand of letters that the player has drawn
def draw_letters
  letters = %W[A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T T T T U U U U V V W W X Y Y Z]
  hand = []
  10.times do
    #drawing 10 letters at random for user hand
    index = rand(letters.length)
    #delete letters that are used in hand to avoid repeats
    hand << letters.delete_at(index)
  end
    #output user hand
  return hand
end

#Wave 2
#method to check if user input only includes letters from the hand
def uses_available_letters?(input,letters_in_hand)
  #splitting the letters from user input ["ADA"] = ["A", "D", "A"]
  #confirming that letters in hand are matching the letters drawn by user
  input.split("").each do |letter|
    if letters_in_hand.include?(letter)
      letters_in_hand.each_with_index do |hand_letter,index|
        if hand_letter == letter
          letters_in_hand.delete_at(index)
          break
        end
      end
    elsif !letters_in_hand.include?(letter)
      return false
    end
  end
  return true
end


#Wave 3
#method to assign a numbered value to each letter
def score_word(word)
  score = 0
  # if the length of the word is greater than 7, 8 additional points are added
  if word.length >= 7
    score = 8
  end

  word.split("").each do |letter|
  #scoring system with letter/point value
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
  #total score of the word
  return score
end



#Wave 4
#method to find the highest scoring word
def highest_score_from(words)
  high = {score: 0, word: "A"}

  words.each do |word|
    score = score_word(word)
    if  score > high[:score]
      high[:score] = score
      high[:word] = word
  #In the case of tie in scores, prefer the word with the fewest letters, unless one word has less than 10 letters
    elsif score == high[:score] && word.length < high[:word].length && high[:word].length < 10
      high[:score] = score_word(word)
      high[:word] = word
  #In the case of tie in scores, prefer the first word with ten letter over the word with fewer tiles
    elsif score == high[:score] && word.length == 10 && high[:word].length != 10
      high[:score] = score_word(word)
      high[:word] = word
    end
  end
#the word with the highest score
  return high

end
