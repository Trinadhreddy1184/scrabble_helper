def create_letter_hash(input_word)
    input_word.downcase.chars.group_by(&:itself).map { | letter, array | [ letter, array.length ] }.to_h
end

def word_possible?(input, reference)
    input_word_hash = create_letter_hash(input)
    reference_word_hash = create_letter_hash(reference)

    reference_word_hash.each do |letter, remaining_instances|
        # Checking if each letter from the reference is present in the input. If not, reference word not possible.
        unless (input_word_hash.key?(letter))
            return false
        end

        # Subtracting a usage of the letter from input
        input_word_hash[letter] -= remaining_instances
    
        # Checking if there were any instances of the input letter remaining. If not, reference word not possible.
        if (input_word_hash[letter] < 0)
            return false
        end
    end
    
    # Returning true, since checks ensure reference word is possible.
    true
end

def get_word_list(input_word)
    dict_array = File.readlines('lib/words_alpha.txt').map(&:strip)

    matching_words_array = []

    dict_array.map do |dict_word|
        if word_possible?(input_word, dict_word)
            matching_words_array << dict_word
        end
    end

    matching_words_array
end

def get_user_input
    gets.chomp.downcase
end

def continue_or_exit
    puts "Would you like to check more letters? (Y/n)"
    
    input = get_user_input

    if input == "y"
        main
    elsif input == "n"
        puts "Exiting program. Thanks for using Scrabble Helper!"
    else
        puts "================================"
        puts "Error: Invalid selection."
        puts "================================"
        continue_or_exit
    end
end

def main
    puts "================================"
    puts "Enter some letters to receive a list of possible words:"
    input = get_user_input
    result = get_word_list(input)

    puts "================================"
    puts "Possible words using #{input}:"
    puts result
    puts "================================"
    
    continue_or_exit
end

main
