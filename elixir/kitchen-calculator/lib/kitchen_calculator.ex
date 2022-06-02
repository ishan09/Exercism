defmodule KitchenCalculator do
  def get_volume({_, vol}) do
    vol
  end

  def to_milliliter({unit, volume}) do
    multiplier = get_ml_multiplier(unit)
      
    {:milliliter,multiplier * volume}
  end

  def from_milliliter({:milliliter, ml}, unit) do
    multiplier = get_ml_multiplier(unit)
    {unit, ml/multiplier}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter() 
    |> from_milliliter(unit)
  end

  defp get_ml_multiplier(unit) do
    case unit do
      :cup -> 
        240
      :fluid_ounce -> 
        30
      :teaspoon -> 
        5
      :tablespoon -> 
        15
      :milliliter -> 
        1
    end
  end
end
