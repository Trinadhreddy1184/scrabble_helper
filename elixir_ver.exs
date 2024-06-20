defmodule ScrabbleModule do
  ## Function to convert word into a map of letter => letter instances
  def mapify_word(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.group_by(fn x -> x end)
    |> Enum.map(fn {char, char_list} -> {char, length(char_list)} end)
    |> Map.new()
  end

  ## Boolean function to check whether a reference word can be made from the characters of an inputted word
  def word_possible?(input, reference) do
    input_map = mapify_word(input)
    reference_map = mapify_word(reference)
    reference_keys = Map.keys(reference_map)

    ## 'Cond' implementation, checking that each reference letter count >= each input letter count, and also no letter counts are nil
    cond do
      !Enum.all?(reference_keys, fn key ->
        Map.get(input_map, key) >= Map.get(reference_map, key) &&
        Map.get(input_map, key) != nil end) ->
          false
      true ->
        true
    end
  end

  ## Returns a list of dictionary words passing the word_possible? check
  def get_word_list(input_word) do
    File.stream!("lib/words_alpha.txt", [:trim_bom, encoding: :utf8])
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> Enum.filter(fn ref_word -> word_possible?(input_word, ref_word) end)
  end
end

require IEx; IEx.pry
