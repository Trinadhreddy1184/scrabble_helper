## Alternate implementations for elixir functions, preserved for learning. This file is not meant to be run!

def word_possible?(input, reference) do
  input_map = mapify_word(input)
  reference_map = mapify_word(reference)

  input_keys = Map.keys(input_map)
  reference_keys = Map.keys(reference_map)

  ## 'Cond' implementation used in production code, checking that each reference letter count >= each input letter count, and also no letter counts are nil
  cond do
    !Enum.all?(reference_keys, fn key ->
      Map.get(input_map, key) >= Map.get(reference_map, key) &&
      Map.get(input_map, key) != nil end) ->
        false
    true ->
      true
  end

  ## 'If' implementation, using above cond logic
  if !Enum.all?(reference_keys, fn key -> Map.get(input_map, key) >= Map.get(reference_map, key) && Map.get(input_map, key) != nil end) do
    false
  else
    true
  end

  ## 'Nested Cond' implementation, separates key check and letter count check into separate nested conds
  cond do
    !Enum.all?(reference_keys, fn key -> Map.has_key?(input_map, key) end) ->
      false
    Enum.all?(reference_keys, fn key -> Map.has_key?(input_map, key) end) ->
      cond do
        !Enum.all?(reference_keys, fn key -> Map.get(input_map, key) >= Map.get(reference_map, key) end) ->
          false
      true ->
        true
      end
  end
end
