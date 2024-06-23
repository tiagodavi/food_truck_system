defmodule FoodTruckSystemWeb.TrackerLive do
  use FoodTruckSystemWeb, :live_view

  alias FoodTruckSystem.Schema.Restaurant

  @limit 12

  def mount(_params, _session, socket) do
    restaurants = Restaurant.load()

    socket = assign(socket, form: to_form(%{"search" => ""}))

    {:ok, stream(socket, :restaurants, restaurants, limit: @limit)}
  end

  def handle_event("search", %{"search" => search}, socket) do
    restaurants =
      search
      |> String.downcase()
      |> Restaurant.load()

    {:noreply, stream(socket, :restaurants, restaurants, reset: true)}
  end
end
