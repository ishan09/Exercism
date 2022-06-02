defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_charlist = base |> String.downcase |> String.to_charlist() |> Enum.sort()
    candidates 
    |> Enum.filter(fn c -> 
      c |> String.downcase  != base |> String.downcase  &&
      (c |> String.downcase |> String.to_charlist() |> Enum.sort() ==  base_charlist)
    end)
  end
end
