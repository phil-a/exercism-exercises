defmodule Bob do
  def hey(input) do
    cond do
      ends_with_question?(input) && has_all_capitals?(input) ->
        "Calm down, I know what I'm doing!"

      ends_with_question?(input) ->
        "Sure."

      has_all_capitals?(input) ->
        "Whoa, chill out!"

      has_whitespace(input) ->
        "Fine. Be that way!"

      true ->
        "Whatever."
    end
  end

  defp ends_with_exclamation?(input) do
    Regex.match?(~r/.*[!]$/, input)
  end

  defp ends_with_question?(input) do
    Regex.match?(~r/.*[?]$/, input)
  end

  defp has_all_capitals?(input) do
    Regex.match?(~r/\b[A-ZА-Я]+\b/, input)
  end

  defp has_whitespace(input) do
    Regex.match?(~r/^\s*$/, input)
  end
end
