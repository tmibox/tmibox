defmodule TmiboxWeb.UserRegistrationController do
  use TmiboxWeb, :controller

  alias Tmibox.Authentication
  alias Tmibox.Authentication.User
  alias TmiboxWeb.UserAuth

  def new(conn, _params) do
    changeset = Authentication.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Authentication.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Authentication.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :edit, &1)
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
