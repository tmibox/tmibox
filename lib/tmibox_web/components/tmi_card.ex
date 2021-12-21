defmodule TmiboxWeb.Components.TmiCard do
  @moduledoc """
  Key component of TmiBox
  """
  use Surface.Component

  @doc "Card"
  prop card, :map


  def render(assigns) do
    ~F"""
    <div id={"tmi-card-#{@card.id}"} class="tmi-card card bordered">
      <div class="card-body">
        <h2 class="card-title">{@card.title}</h2>
        <p>{@card.content}</p>
      </div>
    </div>
    """
  end
end
