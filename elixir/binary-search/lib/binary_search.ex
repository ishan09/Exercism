defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, key), do: :not_found
  def search(numbers, key), do: __search(numbers, key, 0, tuple_size(numbers)-1)
    
  defp __search(numbers, key, pointer_left, pointer_right) do
    pointer = div((pointer_right + pointer_left),2)
    cond do
      elem(numbers, pointer) == key -> 
        {:ok, pointer}
      pointer_right <= pointer_left -> 
        :not_found
      elem(numbers, pointer) > key ->
        __search(numbers, key, pointer_left, pointer-1)
      elem(numbers, pointer) < key ->
        __search(numbers, key, pointer+1, pointer_right)
    end
  end
end











