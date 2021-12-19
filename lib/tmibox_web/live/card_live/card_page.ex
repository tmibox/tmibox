defmodule TmiboxWeb.Pages.CardPage do
  @moduledoc false
  use Surface.LiveView
  alias TmiboxWeb.Router.Helpers, as: Routes
  alias Tmibox.Zettelkasten

  alias TmiboxWeb.Components.TmiCard

  data card, :map

  @impl true
  def render(assigns) do
    ~F"""
    <TmiCard card={@card} />
    """
  end

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    socket = Surface.init(socket)
    case Zettelkasten.get_card(id) do
      %Zettelkasten.Card{} = card ->
        socket =
          socket
          |> assign(card: card)

        {:ok, socket}

      nil ->
        {
          :ok,
          push_redirect(
            socket,
            Routes.live_path(socket, TmiboxWeb.Pages.CardsPage)
          )
        }
    end
  end
end
