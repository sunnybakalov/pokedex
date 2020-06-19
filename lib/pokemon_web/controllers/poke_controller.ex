defmodule PokemonWeb.PokeController do
  use PokemonWeb, :controller

  def search(conn, %{"name" => name}) do
    require IEx;IEx.pry()
    response = Pokemon.search_by_name(name)

    send_resp(conn, 200, Poison.encode!(response))
  end
end
