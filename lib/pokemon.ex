defmodule Pokemon do
  @moduledoc """
  Pokemon keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Pokemon.PokemonApi.{Client, PokeCache}
  require Logger

  @droppable_keys [
    :abilities,
    :base_experience,
    :forms,
    :game_indices,
    :held_items,
    :is_default,
    :location_area_encounters,
    :order,
    :sprites,
    :stats
  ]

  def search(name) do
    PokeCache.get_pokemon_details(name)
  end

  def formatted_search(name) do
    name
    |> search_by_name()
    |> process_response()
    |> keys_to_atoms()
    |> create_poke_map()
    |> format_pokemon_map()
    |> convert_id_to_number()
  end

  def search_by_name(name) do
    name
    |> String.downcase()
    |> Client.pokemon_name_search()
  end

  def get_moves(name) do
    pokemon = formatted_search(name)

    pokemon.moves
    |> Enum.map(fn x -> x.move.name end)
    |> Enum.sort()
  end

  def process_response(res) do
    case res do
      {:ok, body} ->
        {:ok, body}

      {:error, err} ->
        Logger.warn(fn -> "[#{__MODULE__}] Pokemon API call failed: #{inspect(err)}" end)
    end
  end

  def format_pokemon_map(
        %{
          moves: list_of_moves,
          types: list_of_types,
          species: species_map,
        } = pokemon \\ %{}
      ) do
    moves = Enum.map(list_of_moves, fn x -> x.move.name end)

    types = Enum.map(list_of_types, fn x -> x.type.name end)

    %{pokemon | moves: moves, types: types, species: species_map.name}
  end

  def convert_id_to_number(%{id: id} = pokemon) do
    pokemon
    |> Map.delete(:id)
    |> Map.put(:number, id)
  end

  def create_poke_map(poke_map \\ %{}) do
    poke_map
    |> Map.drop(@droppable_keys)
  end

  def keys_to_atoms(string_key_map) when is_map(string_key_map) do
    for {key, val} <- string_key_map, into: %{}, do: {String.to_atom(key), keys_to_atoms(val)}
  end

  def keys_to_atoms(string_key_list) when is_list(string_key_list) do
    string_key_list
    |> Enum.map(&keys_to_atoms/1)
  end

  def keys_to_atoms(value), do: value
end
