defmodule TmiboxWeb.Pages.CardsPage do
  @moduledoc false
  use Surface.LiveView
  alias Tmibox.Zettelkasten
  alias TmiboxWeb.Components.TmiCard

  data cards, :list

  @impl true
  def render(assigns) do
    ~F"""
    <TmiCard :for={card <- @cards} card={card} />
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    socket = Surface.init(socket)

    cards = Zettelkasten.list_cards()

    socket =
      socket
      |> assign(cards: cards)

    {:ok, socket}
  end
end
