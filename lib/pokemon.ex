defmodule Pokemon do
  @moduledoc """
  Pokemon keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Pokemon.PokemonApi.Client
  require Logger

  def search_by_name(name) do
    name
    |> Client.pokemon_name_search()
    |> process_response()
  end

  def process_response(res) do
    case res do
      {:ok, body} ->
        body

      {:error, err} ->
        Logger.warn(fn -> "[#{__MODULE__}] Pokemon API call failed: #{inspect(err)}" end)
    end
  end
end
