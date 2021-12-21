defmodule TmiboxWeb.CardsPageTest do
  use TmiboxWeb.ConnCase, async: true

  import Plug.Conn
  import Phoenix.ConnTest
  import Phoenix.LiveViewTest
  @endpoint TmiboxWeb.Endpoint

  import Tmibox.Factory

  test "connected mount", %{conn: conn} do
    card1 = insert(:card, title: "Hello", content: "World")
    card2 = insert(:card, title: "Hello1", content: "World2")
    card3 = insert(:card, title: "Hello2", content: "World3")

    conn = get(conn, "/")

    {:ok, view, _html} = live(conn)

    assert view
      |> element("#tmi-card-#{card1.id}")
      |> has_element?()

    assert view
      |> element("#tmi-card-#{card2.id}")
      |> has_element?()

    assert view
      |> element("#tmi-card-#{card3.id}")
      |> has_element?()
  end
end
