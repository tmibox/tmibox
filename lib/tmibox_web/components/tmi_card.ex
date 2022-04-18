defmodule TmiboxWeb.Components.TmiCard do
  @moduledoc """
  Key component of TmiBox
  """
  use Surface.Component

  @doc "Card"
  prop card, :map


  def render(assigns) do
    ~F"""
    <div id={"tmi-card-#{@card |> Map.get(:id, 0)}"} class="tmi-card card shadow-lg bordered">
      <div class="card-body">
        <h2 class="card-title text-6xl">{@card.title}</h2>
        <p class="text-3xl pt-3 pb-8">{@card.content}</p>
      </div>
    </div>
    """
  end
end
