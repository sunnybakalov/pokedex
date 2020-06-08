defmodule Pokemon.Data.Pokemon do
  @moduledoc false

  use Ecto.Schema

  @fields ~w(
    name
    abilities
    forms
    moves
    species
    sprites
    stats
    types
  )a

  schema "pokemon" do
    field(:name)
    field(:abilities)
    field(:forms)
    field(:moves)
    field(:species)
    field(:sprites)
    field(:stats)
    field(:types)
  end
end
