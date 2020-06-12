defmodule Pokemon.Data.Poke do
  @moduledoc false

  alias Ecto.Changeset
  import Ecto.Query
  alias Pokemon.Repo
  use Ecto.Schema

  @base_query __MODULE__
  @fields ~w(
    name
    number
    abilities
    forms
    moves
    species
    sprites
    types
    weight
    height
  )a

  schema "pokemon" do
    field(:name)
    field(:number)
    field(:abilities)
    field(:forms)
    field(:moves)
    field(:species)
    field(:sprites)
    field(:types)
    field(:weight)
    field(:height)
  end

  def by_name(name) do
    query =
      __MODULE__
      |> where([p], p.name == ^name)
      |> Repo.one()

    case query do
      nil ->
        {:error, :not_found}

      pokemon ->
        {:ok, pokemon}
    end
  end

  def by_name_query(query \\ @base_query, name) do
    from(p in query, where: p.name == ^name)
  end

  def create(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert(on_conflict: :nothing)
  end

  def changeset(pokemon, params) do
    pokemon
    |> Changeset.cast(params, @fields)
  end
end
