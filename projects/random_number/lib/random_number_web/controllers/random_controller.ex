defmodule RandomNumberWeb.RandomController do
  use RandomNumberWeb, :controller

  def random(conn, _params) do
    random_number = Enum.random(1..100)

    render(conn, :random, number: random_number)
  end
end
