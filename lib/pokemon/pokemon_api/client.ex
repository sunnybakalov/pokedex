defmodule Pokemon.PokemonApi.Client do
  @moduledoc false
  require Logger
  @pokemon_api_host "https://pokeapi.co/api/v2/pokemon/"

  def pokemon_name_search(pokemon_name) do
    HTTPoison.get("#{@pokemon_api_host}#{pokemon_name}")
    |> process_response()
  end

  def process_response({:error, error}) do
    Logger.warn(fn -> "[#{__MODULE__}] Pokemon API call failed #{inspect(error)}" end)
    {:error, "Pokemon API call failed"}
  end

  def process_response({:ok, response}) do
    with 200 <- response.status_code,
         {:ok, body} = Poison.decode(response.body) do
      {:ok, body}
    else
      {:error, error} -> {:error, error}
      _ -> {:error, "Pokemon API call failed. Invalid Pokemon."}
    end
  end
end
