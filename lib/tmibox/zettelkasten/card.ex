defmodule Tmibox.Zettelkasten.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :content, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
