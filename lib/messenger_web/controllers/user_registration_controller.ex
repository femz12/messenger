defmodule MessengerWeb.UserRegistrationController do
  use MessengerWeb, :controller

  alias Messenger.Accounts
  alias Messenger.Accounts.User
  alias MessengerWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :edit, &1)
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_view(MessengerWeb.PageView)
        |> put_root_layout(false)
        |> render("signup.html", changeset: changeset)
    end
  end
end
