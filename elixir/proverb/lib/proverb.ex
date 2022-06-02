defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""
  def recite([hd | _] = strings) do
    strings 
    |> Enum.chunk_every(2, 1, :discard)
    |> List.foldr("And all for the want of a #{hd}.\n", fn([ob1, ob2], acc) -> "For want of a #{ob1} the #{ob2} was lost.\n" <> acc end) 
  end 
end
