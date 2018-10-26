defmodule DropApp do
  use Application

  def start(_type, _args) do
    IO.puts("Starting application")
    DropSup.start_link()
  end
end
