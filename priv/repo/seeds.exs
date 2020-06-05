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

  Repo.insert_all(Types, [
    %{name: "Normal", immunes: ["Ghost"], weaknesses: ["Rock", "Steel"], strengths: []},
    %{
      name: "Fire",
      immunes: [],
      weaknesses: ["Fire", "Water", "Rock", "Dragon"],
      strengths: ["Grass", "Ice", "Bug", "Steel"]
    },
    %{
      name: "Water",
      immunes: [],
      weaknesses: ["Water", "Grass", "Dragon"],
      strengths: ["Fire", "Ground", "Rock"]
    },
    %{
      name: "Electric",
      immunes: ["Ground"],
      weaknesses: ["Electric", "Grass", "Dragon"],
      strengths: ["Water", "Flying"]
    },
    %{
      name: "Grass",
      immunes: [],
      weaknesses: ["Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel"],
      strengths: ["Water", "Ground", "Rock"]
    },
    %{
      name: "Ice",
      immunes: [],
      weaknesses: ["Fire", "Water", "Ice", "Steel"],
      strengths: ["Grass", "Ground", "Flying", "Dragon"]
    },
    %{
      name: "Fighting",
      immunes: ["Ghost"],
      weaknesses: ["Poison", "Flying", "Psychic", "Bug", "Fairy"],
      strengths: ["Normal", "Ice", "Rock", "Dark", "Steel"]
    },
    %{
      name: "Poison",
      immunes: ["Steel"],
      weaknesses: ["Poison", "Ground", "Rock", "Ghost"],
      strengths: ["Grass", "Fairy"]
    },
    %{
      name: "Ground",
      immunes: ["Flying"],
      weaknesses: ["Grass", "Bug"],
      strengths: ["Fire", "Electric", "Poison", "Rock", "Steel"]
    },
    %{
      name: "Flying",
      immunes: [],
      weaknesses: ["Electric", "Rock", "Steel"],
      strengths: ["Grass", "Fighting", "Bug"]
    },
    %{
      name: "Psychic",
      immunes: ["Dark"],
      weaknesses: ["Psychic", "Steel"],
      strengths: ["Fighting", "Poison"]
    },
    %{
      name: "Bug",
      immunes: [],
      weaknesses: ["Fire", "Fighting", "Poison", "Flying", "Ghost", "Steel", "Fairy"],
      strengths: ["Grass", "Psychic", "Dark"]
    },
    %{
      name: "Rock",
      immunes: [],
      weaknesses: ["Fighting", "Ground", "Steel"],
      strengths: ["Fire", "Ice", "Flying", "Bug"]
    },
    %{name: "Ghost", immunes: ["Normal"], weaknesses: ["Dark"], strengths: ["Psychic", "Ghost"]},
    %{name: "Dragon", immunes: ["Fairy"], weaknesses: ["Steel"], strengths: ["Dragon"]},
    %{
      name: "Dark",
      immunes: [],
      weaknesses: ["Fighting", "Dark", "Fairy"],
      strengths: ["Psychic", "Ghost"]
    },
    %{
      name: "Steel",
      immunes: [],
      weaknesses: ["Fire", "Water", "Electric", "Steel"],
      strengths: ["Ice", "Rock", "Fairy"]
    },
    %{
      name: "Fairy",
      immunes: [],
      weaknesses: ["Fire", "Poison", "Steel"],
      strengths: ["Fighting", "Dragon", "Dark"]
    }
  ])
end
