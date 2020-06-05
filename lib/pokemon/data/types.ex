defmodule Pokemon.Data.Types do
  @moduledoc false

  # alias Ecto.Changeset
  # alias Pokemon.Repo
  use Ecto.Schema

  @fields ~w(
    name
    immunes
    weaknesses
    strengths
  )a

  schema "types" do
    field(:name, :string)
    field(:immunes, {:array, :string})
    field(:weaknesses, {:array, :string})
    field(:strengths, {:array, :string})

    timestamps()
  end
end
