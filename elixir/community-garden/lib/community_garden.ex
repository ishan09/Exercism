# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(_opts \\ []) do
    Agent.start(fn -> %{list: [], top_plot_id: 0} end)
  end

  def list_registrations(pid) do
    
    Agent.get(pid, & &1.list)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn(state) -> 
      new_plot_id = state.top_plot_id + 1
      new_plot = %Plot{plot_id: new_plot_id, registered_to: register_to}
      

      {new_plot, %{state | list: [ new_plot | state.list], top_plot_id: new_plot_id}}  
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn(state) -> 
      updated = Enum.filter(state.list, fn(plot)-> plot.plot_id != plot_id end)
      %{state | list: updated}
      end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, & Enum.find(&1.list, fn(plot) -> plot.plot_id == plot_id end))
    |> case do
      %Plot{} = plot -> 
        plot
      _ -> 
        {  :not_found,  "plot is unregistered"}
      end
  end
end
