defmodule TmiboxWeb.Components.TmiCard.Playground do
  use Surface.Catalogue.Playground,
    subject: TmiboxWeb.Components.TmiCard,
    height: "250px",
    body: [style: "padding: 1.5rem;"]

  data props, :map, default: %{
    title: "Card Title",
    content: "Sample Content"
  }

  def render(assigns) do
    ~F"""
    <TmiCard card={%{title: @props.title, content: @props.content}} />
    """
  end
end
