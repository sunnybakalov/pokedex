defmodule PokemonWeb.PokeController do
  use PokemonWeb, :controller

  def search(conn, %{"name" => name}) do
    case Pokemon.search(name) do
      {:ok, pokemon} ->
        send_resp(conn, 200, Poison.encode!(pokemon))
      {:error, err} ->
        conn
        |> put_status(400)
        |> json(%{
          message: "UNABLE TO GET POKEMON",
          error: err
        })
    end
  end
end
