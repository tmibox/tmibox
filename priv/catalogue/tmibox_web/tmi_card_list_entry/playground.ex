defmodule TmiboxWeb.Components.TmiCardListEntry.Playground do
  use Surface.Catalogue.Playground,
    subject: TmiboxWeb.Components.TmiCardListEntry,
    height: "250px",
    body: [style: "padding: 1.5rem;"]

  data props, :map, default: %{
    title: "Card Title",
    content: "Sample Content"
  }

  def render(assigns) do
    ~F"""
    <TmiCardListEntry card={%{title: @props.title, content: @props.content}} />
    """
  end
end
