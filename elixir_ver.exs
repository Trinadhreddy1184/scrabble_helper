defmodule ScrabbleModule do
  def process_word_for_hashing(word) do
    word_downcased = String.downcase(word)
    word_char_list = String.graphemes(word_downcased)
    grouped_char_list = Enum.group_by(word_char_list, fn x -> x end)
    char_tuple_list = Enum.map(grouped_char_list, fn {char, char_list} -> {char, length(char_list)} end)
    char_map = Map.new(char_tuple_list)
    char_map
  end
end

require IEx; IEx.pry
