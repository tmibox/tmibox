defmodule TmiboxWeb.Components.Layouts.AppLayout do
  @moduledoc """
  Component for Layout
  """
  use Surface.Component
  use Phoenix.HTML
  alias TmiboxWeb.Router.Helpers, as: Routes
  alias TmiboxWeb.Endpoint


  @doc "flash object"
  prop flash, :map, default: %{}

  @doc "The content of layout"
  slot default, required: true

  def render(assigns) do
    ~F"""
    <header>
      <section class="container">
        <nav>
          <ul>
            <li><a href="https://hexdocs.pm/phoenix/overview.html">Get Started</a></li>
            {#if function_exported?(Routes, :live_dashboard_path, 2) }
              <li>{ link "LiveDashboard", to: Routes.live_dashboard_path(Endpoint, :home) }</li>
            {/if}
          </ul>
        </nav>
        <a href="https://phoenixframework.org/" class="phx-logo">
          <img src={Routes.static_path(Endpoint, "/images/phoenix.png")} alt="Phoenix Framework Logo"/>
        </a>
      </section>
    </header>
    <main class="container">
      <p class="alert alert-info" role="alert"
        phx-click="lv:clear-flash"
        phx-value-key="info">{ live_flash(@flash, :info) }</p>

      <p class="alert alert-danger" role="alert"
        phx-click="lv:clear-flash"
        phx-value-key="error">{ live_flash(@flash, :error) }</p>

      <#slot />
    </main>
    """
  end
end
