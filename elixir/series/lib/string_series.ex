defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size <= 0, do: []
  def slices(s, size) do
    diff = String.length(s) - size
    if diff < 0 do 
      []
    else
      pointer = Enum.to_list(0..diff)
      for start <-  pointer do
        String.slice(s, start, size)
      end
    end
  end
end
