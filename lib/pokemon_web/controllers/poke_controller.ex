defmodule PokemonWeb.PokeController do
  use PokemonWeb, :controller

  alias Pokemon.Data.Poke

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

  def get_all(conn, _params) do
    pokemon = Poke.get_all()

    send_resp(conn, 200, Poison.encode!(pokemon))
  end
end
