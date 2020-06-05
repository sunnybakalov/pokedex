defmodule Pokemon.Data.Moves do
  @moduledoc false

  # alias Ecto.Changeset
  # alias Pokemon.Repo
  use Ecto.Schema

  @fields ~w(
    name
    power
    accuracy
  )a

  schema "types" do
    field(:name, :string)
    field(:power, :integer)
    field(:accuracy, :integer)

    timestamps()
  end
end
