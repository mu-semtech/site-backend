defmodule Dispatcher do

  use Plug.Router

  def start(_argv) do
    port = 80
    IO.puts "Starting Plug with Cowboy on port #{port}"
    Plug.Adapters.Cowboy.http __MODULE__, [], port: port
    :timer.sleep(:infinity)
  end

  plug Plug.Logger
  plug :match
  plug :dispatch

  match "/export/*path" do
    Proxy.forward conn, path, "http://export/"
  end

  match "/menu-holders/*path" do
    Proxy.forward conn, path, "http://resource/menu-holders/"
  end

  match "/menus/*path" do
    Proxy.forward conn, path, "http://resource/menus/"
  end

  match "/pages/*path" do
    Proxy.forward conn, path, "http://resource/pages/"
  end

  match _ do
    send_resp( conn, 404, "Route not found" )
  end

end
