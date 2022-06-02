defmodule LogLevel do

  def to_label(level, legacy?) do
    case {level, legacy?} do
      {0, false} -> :trace
      {1, _} -> :debug
      {2, _} -> :info
      {3, _} -> :warning
      {4, _} -> :error
      {5, false} -> :fatal
      {_, _} -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = level |> to_label(legacy?)
    cond  do
      label in [:fatal, :error] -> 
        :ops
      legacy? && label == :unknown -> 
        :dev1
      !legacy? && label == :unknown -> 
        :dev2
      true -> 
        false
    end
  end
end
