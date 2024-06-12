# require 'lib/words_alpha.txt'

def initialize_dictionary_file(file_path)
    @words_array = File.readlines(file_path).map(&:strip)
end

def initialize_word_details(word)
    @word_chars = word.chars
    @word_chars_count = word.chars.count
end

require 'pry'; binding.pry