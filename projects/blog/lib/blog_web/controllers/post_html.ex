defmodule BlogWeb.PostHTML do
  use BlogWeb, :html

  embed_templates("post_html/*")
  embed_templates("comment_html/*")

  @doc """
  Renders a post form.
  """
  attr(:changeset, Ecto.Changeset, required: true)
  attr(:action, :string, required: true)

  def post_form(assigns)

  def greet(assigns) do
    assigns = assign(assigns, :today, Date.utc_today())

    ~H"""
    <h2 class="text-3xl">Hello World, from <%= @messenger %>!</h2>
    <p>Today was <%= @today %></p>
    """
  end
end
