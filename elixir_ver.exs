defmodule ScrabbleModule do
  def mapify_word(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.group_by(fn x -> x end)
    |> Enum.map(fn {char, char_list} -> {char, length(char_list)} end)
    |> Map.new()
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
