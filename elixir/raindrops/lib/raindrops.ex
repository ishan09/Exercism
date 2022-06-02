defmodule Raindrops do
  @sounds %{3 => "Pling",5 => "Plang", 7 => "Plong"}

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
     str = Map.keys(@sounds) |> Enum.map(&get_sound(number, &1)) |> Enum.join()
     if str == "" do
        Integer.to_string(number)
      else
        str
      end
        
  end

  defp get_sound(number, num) when rem(number, num) == 0, do: Map.get(@sounds, num)
  defp get_sound(_number, _), do: ""
end
