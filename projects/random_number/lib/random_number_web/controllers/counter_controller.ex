defmodule RandomNumberWeb.CounterController do
  use RandomNumberWeb, :controller

  def counter(conn, _params) do
    render(conn, :counter, count: 0)
  end
end
