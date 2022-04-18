defmodule TmiboxWeb.Pages.CardsPage do
  @moduledoc false
  use Surface.LiveView
  alias Tmibox.Zettelkasten

  alias TmiboxWeb.Components.Layouts.AppLayout
  alias TmiboxWeb.Components.TmiCardListEntry, as: TmiCard

  alias Tmibox.Authentication

  data cards, :list

  @impl true
  def render(assigns) do
    ~F"""
    <AppLayout current_user={@current_user}>
      <TmiCard :for={card <- @cards} card={card} />
    </AppLayout>
    """
  end

  @impl true
  def mount(_params, session, socket) do
    socket = Surface.init(socket)

    user = case session do
      %{"user_token" => user_token} -> Authentication.get_user_by_session_token(user_token)
      _ -> %{}
    end
    cards = Zettelkasten.list_cards()

    socket =
      socket
      |> assign(cards: cards, current_user: user)

    {:ok, socket}
  end
end
