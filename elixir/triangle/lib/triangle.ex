defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    with :ok <- non_negative(a,b, c),
        :ok <- inequiality(a, b, c)
      
    do
      cond do
        a == b && b == c ->
         {:ok, :equilateral}
        a == b || b == c || a == c -> 
          {:ok, :isosceles}
        true -> 
          {:ok, :scalene}
      end
    else 
      error -> 
        error
    end
      
  end

  defp inequiality(a, b, c) do
    if a + b >= c &&
        b + c >= a &&
        a + c >= b do
      :ok
    else
      {:error, "side lengths violate triangle inequality"}
    end
  end

  defp non_negative(a,b,c) do
      if a > 0 && b > 0 && c > 0 do
        :ok
      else
        {:error, "all side lengths must be positive"}
      end
end
        
      



end
