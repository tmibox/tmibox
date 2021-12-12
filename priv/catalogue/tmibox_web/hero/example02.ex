defmodule TmiboxWeb.Components.Hero.Example02 do
  @moduledoc """
  Example using the `color` property.
  """

  use Surface.Catalogue.Example,
    subject: TmiboxWeb.Components.Hero,
    height: "700px",
    title: "Colors"

  alias TmiboxWeb.Components.Hero

  def render(assigns) do
    ~F"""
    <Hero
      name="John Doe"
      subtitle="How are you?"
      color="info"
    />
    <Hero
      name="John Doe"
      subtitle="How are you?"
      color="warning"
    />
    <Hero
      name="John Doe"
      subtitle="How are you?"
      color="danger"
    />
    """
  end
end
