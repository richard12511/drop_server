defmodule DropServer do
  use GenServer

  defmodule State do
    defstruct count: 0
  end

  def start_link do
    GenServer.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  def init([]) do
    {:ok, %State{}}
  end

  def handle_call(request, _from, state) do
    reply = {:ok, fall_velocity(request)}
    new_state = %State{count: state.count + 1}

    {:reply, reply, new_state}
  end

  def handle_cast(_request, state) do
    IO.puts("Calculated #{state} velocities.")
    {:noreply, state}
  end

  def fall_velocity(distance) do
    :math.sqrt(2 * 9.8 * distance)
  end

end
