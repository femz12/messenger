defmodule MessengerWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, %{}) do
    conn
    |> put_status(:not_found)
    |> put_view(MessagerWeb.ErrorView)
    |> text("404")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(403)
    |> put_view(MessengerWeb.ErrorView)
    |> render(:"403")
  end
end
