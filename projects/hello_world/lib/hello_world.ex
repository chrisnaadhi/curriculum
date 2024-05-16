defmodule HelloWorld do
  @moduledoc """
  Documentation for `HelloWorld`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> HelloWorld.hello()
      :world

  """
  def hello do
    "Hello, #{Faker.Person.first_name()}"
  end

  def salute(name \\ HelloWorld.Name.random()) do
    cond do
      name
      |> is_binary() ->
        HelloWorld.Greeting.salutations(name)

      true ->
        HelloWorld.Greeting.Formal.charmed()
    end
  end
end
