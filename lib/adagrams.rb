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
  input.split("").each do | letter |
    if !letters_in_hand.include?(letter)
      return false
    elsif letters_in_hand.include?(letter)
      letters_in_hand.length.times do |index|
        letters_in_hand.delete_at(index)
      return true
      end
    end
  end
end
