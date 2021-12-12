defmodule Tmibox.Factory do
  use ExMachina.Ecto, repo: Tmibox.Repo
  use Tmibox.CardFactory
end
