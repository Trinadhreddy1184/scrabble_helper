defmodule ScrabbleModule do
  def mapify_word(word) do
    word_downcased = String.downcase(word)
    word_char_list = String.graphemes(word_downcased)
    grouped_char_list = Enum.group_by(word_char_list, fn x -> x end)
    char_tuple_list = Enum.map(grouped_char_list, fn {char, char_list} -> {char, length(char_list)} end)
    Map.new(char_tuple_list)
  end

  def word_possible?(input, reference) do
    input_map = mapify_word(input)
    reference_map = mapify_word(reference)

    input_keys = Map.keys(input_map)
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

    ## 'If' implementation, using above cond logic
    # if !Enum.all?(reference_keys, fn key -> Map.get(input_map, key) >= Map.get(reference_map, key) && Map.get(input_map, key) != nil end) do
    #   false
    # else
    #   true
    # end

    ## 'Nested Cond' implementation, separates key check and letter count check into separate nested conds
    # cond do
    #   !Enum.all?(reference_keys, fn key -> Map.has_key?(input_map, key) end) ->
    #     false
    #   Enum.all?(reference_keys, fn key -> Map.has_key?(input_map, key) end) ->
    #     cond do
    #       !Enum.all?(reference_keys, fn key -> Map.get(input_map, key) >= Map.get(reference_map, key) end) ->
    #         false
    #     true ->
    #       true
    #     end
    # end
  end
end

require IEx; IEx.pry
