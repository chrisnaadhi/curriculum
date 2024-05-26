defmodule BlogWeb.MyComponents do
  use Phoenix.Component

  def greet(assigns) do
    ~H"""
    <p>Hello, <%= @name %>!</p>
    """
  end
end
