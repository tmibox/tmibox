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

  @doc "current logged in user"
  prop current_user, :map, default: %{}

  @doc "The content of layout"
  slot default, required: true

  def render(assigns) do
    ~F"""
    <header>
      <section class="container max-w-screen-lg mx-auto">
        <div class="navbar bg-base-100 justify-between">
          <div class="flex-1">
            <a
              class="btn btn-ghost normal-case text-xl"
              href="/"
            >
              TMI Box
            </a>
          </div>
          <div class="flex-none">
            <div class="dropdown dropdown-end">
              <label tabindex="0" class="btn btn-ghost btn-circle">
                <div class="indicator">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" /></svg>
                  <span class="badge badge-sm indicator-item">8</span>
                </div>
              </label>
              <div tabindex="0" class="mt-3 card card-compact dropdown-content w-52 bg-base-100 shadow">
                <div class="card-body">
                  <span class="font-bold text-lg">8 Items</span>
                  <span class="text-info">Subtotal: $999</span>
                  <div class="card-actions">
                    <button class="btn btn-primary btn-block">View cart</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="dropdown dropdown-end">
              {#if @current_user != %{}}
                <label tabindex="0" class="btn btn-ghost btn-circle avatar">
                  <div class="w-10 rounded-full">
                    <img src="https://api.lorem.space/image/face?hash=33791" />
                  </div>
                </label>
                <ul tabindex="0" class="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52">
                  <li>
                    <a class="justify-between">
                      { @current_user.email }
                      <span class="badge">New</span>
                    </a>
                  </li>
                  <li><a>Settings</a></li>
                  <li><a>Log out</a></li>
                </ul>
              {/if}
            </div>
          </div>
        </div>
      </section>
    </header>
    <main class="container max-w-screen-lg mx-auto">
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
