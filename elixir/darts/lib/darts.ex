defmodule Darts do

  @type position :: {number, number}
  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    radius = radius(x,y) 
    cond do
      radius <= 1 -> 10
      radius <= 25 -> 5
      radius <= 100 -> 1
      true -> 0
    end
  end

  defp radius(x, y) do
    x*x + y*y
  end
end
