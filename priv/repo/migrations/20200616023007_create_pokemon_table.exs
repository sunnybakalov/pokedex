defmodule Pokemon.Repo.Migrations.CreatePokemonTable do
  use Ecto.Migration

  def change do
    create table(:pokemon) do
      add :name, :string, null: false
      add :number, :integer, null: false
      add :moves, {:array, :string}
      add :species, :string
      add :types, {:array, :string}
      add :weight, :integer
      add :height, :integer

      timestamps()
    end
  end
end
