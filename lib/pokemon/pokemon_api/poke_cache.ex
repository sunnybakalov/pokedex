defmodule Pokemon.PokemonApi.PokeCache do
  @moduledoc false

  alias Pokemon.Data.Poke
  alias Pokemon.Repo
  require Logger

  def get_pokemon_details(name) do
    case get_cached(name) do
      {:error, :not_found} -> get_and_cache(name)
      cached -> cached
    end
  end

  def get_and_cache(name) do
    with {:ok, pokemon} <- Pokemon.search_by_name(name),
         {:ok, response} <- Pokemon.process_response({:ok, pokemon}) do
      poke_map =
        response
        |> Pokemon.keys_to_atoms()
        |> Pokemon.create_poke_map()
        |> Pokemon.format_pokemon_map()
        |> Pokemon.convert_id_to_number()

      cache_pokemon(name, poke_map)
    else
      {:error, err} ->
        err
    end
  end

  def cache_pokemon(name, pokemon) do
    case Poke.by_name(name) do
      {:ok, found_pokemon} -> {:ok, found_pokemon}
      {:error, :not_found} -> Poke.create(pokemon)
    end
  end

  def get_cached(name) do
    if exists?(name) do
      Poke.by_name(name)
    else
      {:error, :not_found}
    end
  end

  def exists?(name) do
    name
    |> Poke.by_name_query()
    |> Repo.exists?()
  end
end
