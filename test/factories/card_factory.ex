defmodule Tmibox.CardFactory do
  defmacro __using__(_opts) do
    quote do
      def card_factory do
        %Tmibox.Zettelkasten.Card{
          title: "My awesome article!",
          content: "Still working on it!"
        }
      end
    end
  end
end
