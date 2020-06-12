defmodule Seeds do
  # Script for populating the database. You can run it as:
  #
  #     mix run priv/repo/seeds.exs
  #
  # Inside the script, you can read and write to any of your
  # repositories directly:
  #
  #     Pokemon.Repo.insert!(%Pokemon.SomeSchema{})
  #
  # We recommend using the bang functions (`insert!`, `update!`
  # and so on) as they will fail if something goes wrong.

  alias Pokemon.Data.{
    Moves,
    Types
  }

  alias Pokemon.Repo

  @time NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
  @moves_filepath "moves.json"

  Repo.insert_all(Types, [
    %{name: "Normal", immunes: ["Ghost"], weaknesses: ["Rock", "Steel"], strengths: []},
    %{
      name: "Fire",
      immunes: [],
      weaknesses: ["Fire", "Water", "Rock", "Dragon"],
      strengths: ["Grass", "Ice", "Bug", "Steel"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Water",
      immunes: [],
      weaknesses: ["Water", "Grass", "Dragon"],
      strengths: ["Fire", "Ground", "Rock"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Electric",
      immunes: ["Ground"],
      weaknesses: ["Electric", "Grass", "Dragon"],
      strengths: ["Water", "Flying"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Grass",
      immunes: [],
      weaknesses: ["Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel"],
      strengths: ["Water", "Ground", "Rock"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Ice",
      immunes: [],
      weaknesses: ["Fire", "Water", "Ice", "Steel"],
      strengths: ["Grass", "Ground", "Flying", "Dragon"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Fighting",
      immunes: ["Ghost"],
      weaknesses: ["Poison", "Flying", "Psychic", "Bug", "Fairy"],
      strengths: ["Normal", "Ice", "Rock", "Dark", "Steel"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Poison",
      immunes: ["Steel"],
      weaknesses: ["Poison", "Ground", "Rock", "Ghost"],
      strengths: ["Grass", "Fairy"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Ground",
      immunes: ["Flying"],
      weaknesses: ["Grass", "Bug"],
      strengths: ["Fire", "Electric", "Poison", "Rock", "Steel"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Flying",
      immunes: [],
      weaknesses: ["Electric", "Rock", "Steel"],
      strengths: ["Grass", "Fighting", "Bug"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Psychic",
      immunes: ["Dark"],
      weaknesses: ["Psychic", "Steel"],
      strengths: ["Fighting", "Poison"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Bug",
      immunes: [],
      weaknesses: ["Fire", "Fighting", "Poison", "Flying", "Ghost", "Steel", "Fairy"],
      strengths: ["Grass", "Psychic", "Dark"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Rock",
      immunes: [],
      weaknesses: ["Fighting", "Ground", "Steel"],
      strengths: ["Fire", "Ice", "Flying", "Bug"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Ghost",
      immunes: ["Normal"],
      weaknesses: ["Dark"],
      strengths: ["Psychic", "Ghost"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Dragon",
      immunes: ["Fairy"],
      weaknesses: ["Steel"],
      strengths: ["Dragon"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Dark",
      immunes: [],
      weaknesses: ["Fighting", "Dark", "Fairy"],
      strengths: ["Psychic", "Ghost"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Steel",
      immunes: [],
      weaknesses: ["Fire", "Water", "Electric", "Steel"],
      strengths: ["Ice", "Rock", "Fairy"],
      inserted_at: @time,
      updated_at: @time
    },
    %{
      name: "Fairy",
      immunes: [],
      weaknesses: ["Fire", "Poison", "Steel"],
      strengths: ["Fighting", "Dragon", "Dark"],
      inserted_at: @time,
      updated_at: @time
    }
  ])

  # this will insert the entries into the Moves table
  @moves_filepath
  |> Moves.get_json()
  |> Moves.bulk_insert()
end
