defmodule PokemonWeb.PokeController do
  use PokemonWeb, :controller

  def search(conn, %{"name" => name}) do
    response = Pokemon.search_by_name(name)

    send_resp(conn, 200, Poison.encode!(response))
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
