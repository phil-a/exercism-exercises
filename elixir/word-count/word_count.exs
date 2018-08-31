defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> replace_underscores()
    |> strip_punctuation_except_hyphen()
    |> strip_whitespace()
    |> String.downcase()
    |> String.split([" ", "_"])
    |> create_word_map()
  end

  defp replace_underscores(sentence), do: Regex.replace(~r/[_]+/u, sentence, " ")

  defp strip_punctuation_except_hyphen(sentence),
    do: Regex.replace(~r/[\p{P}\p{S}](?<!-)/u, sentence, "")

  defp strip_whitespace(sentence), do: Regex.replace(~r/\s\s+/, sentence, " ")

  defp create_word_map(list, map \\ %{})

  # Base case (list is empty)
  defp create_word_map([], map), do: map

  # Recursive case (increment count and reduce list size)
  defp create_word_map([hd | tl], map) do
    map = Map.update(map, hd, 1, &(&1 + 1))
    create_word_map(tl, map)
  end
end
