defmodule TmiboxWeb.Components.TmiCardListEntry do
  @moduledoc """
  메인 화면에서 보여지는 리스트 뷰의 TmiCard 컴포넌트
  """
  use Surface.Component
  alias Surface.Components.Link
  alias TmiboxWeb.Router.Helpers, as: Routes

  @doc "Card"
  prop card, :map

  def like_button_icon(_card) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
    </svg>
    """
  end

  def render(assigns) do
    card_id = assigns.card |> Map.get(:id, 0)

    ~F"""
    <Link
      id={"tmi-card-#{card_id}"}
      class="cursor-pointer"
      to={Routes.live_path(TmiboxWeb.Endpoint, TmiboxWeb.Pages.CardPage, card_id)}
    >
      <div class="tmi-card-list-entry my-4 mx-0 card shadow-lg bordered">
        <div class="card-body">
          <div class="card-body-wrapper">
            <h2 class="card-title text-4xl pb-6">{@card.title}</h2>
            <p class="text-2xl">{@card.content}</p>
          </div>
          <div class="card-actions justify-end">
            <div class="like-action flex items-center justify-center">
              <button class="btn btn-circle btn-outline btn-accent">
                {raw(like_button_icon(@card))}
              </button>
            </div>
            <div class="bookmark-action flex item-center justify-center">
            </div>
            <div class="share-action flex item-center justify-center">
            </div>
          </div>
        </div>
      </div>
    </Link>
    """
  end
end
