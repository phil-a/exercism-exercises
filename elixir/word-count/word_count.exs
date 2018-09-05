defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> sanitize_sentence()
    |> String.downcase()
    |> String.split([" ", "_"], trim: true)
    |> Enum.reduce(%{}, fn x, acc ->
      Map.update(acc, x, 1, &(&1 + 1))
    end)
  end

  defp sanitize_sentence(sentence) do
    Regex.replace(~r/[^[:alnum:]- _]/u, sentence, "")
  end
end
