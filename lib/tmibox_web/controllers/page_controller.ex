defmodule TmiboxWeb.PageController do
  use TmiboxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
