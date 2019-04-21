defmodule TestStack01Web.PageController do
  use TestStack01Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
