defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory,&(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory,&is_nil(&1.price))
  end

  def increase_quantity(item, count) do
    updated_quantity  = Enum.into(item.quantity_by_size, %{},  fn({k,v}) -> {k, v + count} end)
    %{item | quantity_by_size: updated_quantity}
  end

  def total_quantity(item) do
      item.quantity_by_size |> Enum.reduce(0, fn({_k,v}, acc) -> v+acc end)
  end
end
