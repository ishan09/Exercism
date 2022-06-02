defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([]), do: new()
  def remove([_|tail]), do: tail

  def first([hd | _]), do: hd

  def count(list), do: length(list)
  
  def exciting_list?([]), do: false
  def exciting_list?(["Elixir" | _tail]), do: true
  def exciting_list?([_ | tail]), do: exciting_list?(tail)
end
