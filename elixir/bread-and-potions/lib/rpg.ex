defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    def eat(item, char)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(%RPG.LoafOfBread{}, %RPG.Character{health: h} = char) do
       {nil, %RPG.Character{char | health: h+5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(%RPG.ManaPotion{strength: s}, %RPG.Character{mana: m} = char) do
       {%RPG.EmptyBottle{}, %RPG.Character{char | mana: m+s}}
    end
  end
  defimpl Edible, for: Poison do
    def eat(%RPG.Poison{}, %RPG.Character{} = char) do
       {%RPG.EmptyBottle{}, %RPG.Character{char | health: 0}}
    end
  end
end
