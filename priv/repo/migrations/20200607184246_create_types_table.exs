defmodule Pokemon.Repo.Migrations.CreateTypesTable do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :name, :string, null: false
      add :immunes, {:array, :string}
      add :weaknesses, {:array, :string}
      add :strengths, {:array, :string}

      timestamps()
    end
  end
end
