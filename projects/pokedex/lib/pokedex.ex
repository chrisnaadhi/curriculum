defmodule Pokedex do
  def get(name) do
    Finch.start_link(name: Pokedex.Finch)

    response =
      Finch.build(:get, "https://pokeapi.co/api/v2/pokemon/#{name}")
      |> Finch.request!(Pokedex.Finch)

    decoded_body = Jason.decode!(response.body)
  end

  def all() do
    Finch.start_link(name: Pokedex.Finch)

    response =
      Finch.build(:get, "https://pokeapi.co/api/v2/pokemon")
      |> Finch.request!(Pokedex.Finch)

    decoded_body = Jason.decode!(response.body)
  end
end
