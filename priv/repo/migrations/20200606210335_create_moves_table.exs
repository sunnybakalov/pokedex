defmodule Pokemon.Repo.Migrations.CreateMovesTable do
  use Ecto.Migration

  def change do
    create table(:moves) do
      add :name, :string, null: false
      add :power, :integer
      add :accuracy, :integer

      timestamps()
    end
  end
end
