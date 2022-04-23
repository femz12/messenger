defmodule MessengerWeb.PageController do
  use MessengerWeb, :controller

  alias Messenger.Accounts
  alias Messenger.Accounts.User

  def index(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    conn
    |> put_root_layout(false)
    |> render("signup.html", changeset: changeset)
  end


  def signin(conn, _params) do
    conn
    |> put_root_layout(false)
    |> render("signin.html", error_message: nil)
  end
end
