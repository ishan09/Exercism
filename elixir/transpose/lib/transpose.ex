defmodule Transpose do
  @doc """
  Given an input text, output it transposed.

  Rows become columns and columns become rows. See https://en.wikipedia.org/wiki/Transpose.

  If the input has rows of different lengths, this is to be solved as follows:
    * Pad to the left with spaces.
    * Don't pad to the right.

  ## Examples

    iex> Transpose.transpose("ABC\\nDE")
    "AD\\nBE\\nC"

    iex> Transpose.transpose("AB\\nDEF")
    "AD\\nBE\\n F"
  """

  @spec transpose(String.t()) :: String.t()
  def transpose(input) do
    String.split(input, "\n")
    |> List.foldr({0, []}, fn str, {count, acc} ->
      case {count, acc} do
        {_, []} ->
          {String.length(str), [str | acc]}

        {count, acc} ->
          str1 = String.pad_trailing(str, count)
          if String.length(str) < count do
            {count, [str1 | acc]}
          else
            {String.length(str), [str | acc]}
          end
      end
    end)
    |> (fn {_, list} -> list end).()
    |> List.foldl([], fn str, acc -> transpose_(acc, String.graphemes(str)) end)
    |> Enum.map(&Enum.join/1)
    |> Enum.join("\n")
  end

  defp transpose_(acc, str, acc1 \\ [])
  defp transpose_([], [], acc), do: acc
  defp transpose_([l1 | t1], [], acc), do: transpose_(t1, [], acc ++ [[l1]])
  defp transpose_([], [h1 | t2], acc1), do: transpose_([], t2, acc1 ++ [[h1]])
  defp transpose_([l1 | t1], [h1 | t2], acc1), do: transpose_(t1, t2, acc1 ++ [l1 ++ [h1]])
end
