defmodule MessengerWeb.MessengerView do
  use MessengerWeb, :view

  def title() do
    "Awesome New Title!"
  end

  def city(assigns) do
    ~H"""
    The chosen city is: <%= @name %>.
    """
  end
end
