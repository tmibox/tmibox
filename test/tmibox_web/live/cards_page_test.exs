defmodule TmiboxWeb.CardsPageTest do
  use TmiboxWeb.ConnCase, async: true

  import Plug.Conn
  import Phoenix.ConnTest
  import Phoenix.LiveViewTest
  @endpoint TmiboxWeb.Endpoint

  import Tmibox.Factory

  alias TmiboxWeb.Router.Helpers, as: Routes

  describe "About page loading" do
    test "TmiCard의 갯수만큼 성공적으로 렌더링이 된다.", %{conn: conn} do
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

  describe "About redirection" do
    test "각각의 TmiCard에 대한 상세페이지로 리다이렉션이 된다.", %{conn: conn} do
      card1 = insert(:card, title: "Hello", content: "World")
      card2 = insert(:card, title: "Hello1", content: "World2")
      card3 = insert(:card, title: "Hello2", content: "World3")

      conn = get(conn, "/")
      {:ok, view, _html} = live(conn)

      view
        |> element("#tmi-card-#{card1.id}")
        |> render_click
      assert_redirect(view, Routes.live_path(TmiboxWeb.Endpoint, TmiboxWeb.Pages.CardPage, card1.id))

      conn = get(conn, "/")
      {:ok, view, _html} = live(conn)

      view
        |> element("#tmi-card-#{card2.id}")
        |> render_click
      assert_redirect(view, Routes.live_path(TmiboxWeb.Endpoint, TmiboxWeb.Pages.CardPage, card2.id))

      conn = get(conn, "/")
      {:ok, view, _html} = live(conn)

      view
        |> element("#tmi-card-#{card3.id}")
        |> render_click
      assert_redirect(view, Routes.live_path(TmiboxWeb.Endpoint, TmiboxWeb.Pages.CardPage, card3.id))
    end
  end
end
