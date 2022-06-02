defmodule BirdCount do
def today([]), do: nil  
def today([td| _]) do
    td
  end

  def increment_day_count([]), do: [1]
  def increment_day_count([td|l]) do
    [td+1|l]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0|t]), do: true
  def has_day_without_birds?([_|t]), do: has_day_without_birds?(t)


  def total(_kjh, acc \\0)
  def total([], acc), do: acc

  def total([h|t], acc) do
    total(t, acc+h)
  end

   def busy_days(_kjh, acc  \\0)
  def busy_days([], acc), do: acc |> IO.inspect
  def busy_days([h|t], acc) when h >= 5, do:  busy_days(t, acc+1|> IO.inspect)
  def busy_days([_|t], acc), do:  busy_days(t, acc)
  
end
