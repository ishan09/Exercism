defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from(params) do
    params
    |> NaiveDateTime.from_erl
    |> case do
      {:ok, time} -> time |> NaiveDateTime.add(1_000_000_000, :second) |> NaiveDateTime.to_erl()
       error -> error
    end
  end
end
