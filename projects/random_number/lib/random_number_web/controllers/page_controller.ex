defmodule RandomNumberWeb.PageController do
  use RandomNumberWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  def projects(conn, _params) do
    render(conn, :projects)
  end
end
