defmodule MessengerWeb.MessengerController do
  use MessengerWeb, :controller

  action_fallback MessengerWeb.FallbackController

  def home(conn, params) when params == :ok do
      json(conn, %{"ok" => "done"})
  end

  def profile(conn, %{"username" => username}) do
    text(conn, username)
    render(conn, "profile.html", username: username)
  end
end
