defmodule ResistorColorTrio do
  @color_code %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }  

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label([tens,once, zeros]) do
    tens = Map.get(@color_code, tens)
    once = Map.get(@color_code, once)
    zeros = Map.get(@color_code, zeros)

    {(tens*10+once)*(:math.pow(10, zeros)), :ohms} |> format()
  end

  defp format({value, :ohms}) when value > 1000, do: {value/1000, :kiloohms}
  defp format(a), do: a

end
