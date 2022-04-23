defmodule MessengerWeb.MessengerController do
  use MessengerWeb, :controller

  action_fallback MessengerWeb.FallbackController

  def home(conn, _params) do

      conn
      |> put_root_layout(false)
      |> render("home.html")
  end

  def profile(conn, %{"username" => username}) do
    text(conn, username)
    render(conn, "profile.html", username: username)
  end
end
