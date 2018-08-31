defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide, total \\ 0)

  def count([hd | tl], nucleotide, total) do
    case hd === nucleotide do
      true -> total = total + 1
      false -> nil
    end

    count(tl, nucleotide, total)
  end

  def count([], _, total), do: total

  def nucleotides, do: @nucleotides

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    histogram =
      NucleotideCount.nucleotides()
      |> Enum.chunk(1)
      |> Enum.map(fn [a] -> {a, NucleotideCount.count(strand, a)} end)
      |> Map.new()
  end
end
