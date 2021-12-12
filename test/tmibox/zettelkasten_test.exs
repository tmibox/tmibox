defmodule Tmibox.ZettelkastenTest do
  use Tmibox.DataCase

  alias Tmibox.Zettelkasten

  describe "cards" do
    alias Tmibox.Zettelkasten.Card

    import Tmibox.ZettelkastenFixtures

    @invalid_attrs %{content: nil, title: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Zettelkasten.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Zettelkasten.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{content: "some content", title: "some title"}

      assert {:ok, %Card{} = card} = Zettelkasten.create_card(valid_attrs)
      assert card.content == "some content"
      assert card.title == "some title"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Zettelkasten.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{content: "some updated content", title: "some updated title"}

      assert {:ok, %Card{} = card} = Zettelkasten.update_card(card, update_attrs)
      assert card.content == "some updated content"
      assert card.title == "some updated title"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Zettelkasten.update_card(card, @invalid_attrs)
      assert card == Zettelkasten.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Zettelkasten.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Zettelkasten.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Zettelkasten.change_card(card)
    end
  end
end
