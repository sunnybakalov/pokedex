defmodule Pokemon.Data.Moves do
  @moduledoc false

  # alias Ecto.Changeset
  alias Pokemon.Repo
  import Ecto.Query
  use Ecto.Schema

  @fields ~w(
    name
    power
    accuracy
  )a
  @time NaiveDateTime.truncate(NaiveDateTime.utc_now, :microsecond)

  schema "moves" do
    field(:name, :string)
    field(:power, :integer)
    field(:accuracy, :integer)

    timestamps()
  end

  def by_name(name) do
    __MODULE__
    |> where([m], m.name == ^name)
    |> Repo.one()
  end

  def bulk_insert(list_of_moves) do
    Repo.insert_all(__MODULE__, list_of_moves)
  end

  # run this function to get the JSON in a format that is ready to insert
  def get_json(file_path) do
    with {:ok, body} <- File.read(file_path),
    {:ok, json} <- Poison.decode(body) do
      json
      |> moves_mapper()
      |> string_map_to_atom_map()
    end
  end

  def moves_mapper(list_of_move_maps) do
    list_of_move_maps
    |> Enum.map(fn x -> %{"name" => x["ename"], "power" => x["power"], "accuracy" => x["accuracy"]} end)
  end

  def string_map_to_atom_map(string_map) do
    string_map
    |> Enum.map(fn x -> %{name: x["name"], accuracy: x["accuracy"], power: x["power"], inserted_at: @time, updated_at: @time} end)
  end

end
