defmodule Tmibox.ZettelkastenFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tmibox.Zettelkasten` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> Tmibox.Zettelkasten.create_card()

    card
  end
end
