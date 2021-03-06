defmodule Allergies do

  @allergy_score [cats: 128, pollen: 64, chocolate: 32, tomatoes: 16, strawberries: 8, shellfish: 4, peanuts: 2, eggs: 1]
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
  {allergies, _} =  
    @allergy_score |> Enum.reduce({[], flags},fn ({k,v}, {acc, flag}) -> 
          case {div(flag, v), rem(flag, v)}do
            {0, rem} ->
                {acc, rem}
            {_, rem} -> 
              {[Atom.to_string(k)  | acc], rem}    
          end
      end)
    allergies
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    list(flags) |> Enum.any?(& &1 == item)
  end
end
