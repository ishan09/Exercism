defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list

  def flatten(), do: []
  def flatten([]), do: []
  def flatten([nil | l]), do: flatten(l)
  def flatten([h | l]) when is_list(h), do: flatten(h) ++ flatten(l)
  def flatten([h | l]), do: [h | flatten(l)]
end
