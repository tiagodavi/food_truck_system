defmodule FoodTruckSystemWeb.TrackerLiveTest do
  use FoodTruckSystemWeb.ConnCase

  describe "Search" do
    test "display a list of restaurants for Brazilian Food", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/tracker")

      assert view
             |> element("form")
             |> render_change(%{search: "Brazilian"}) =~ "Brazilian"
    end
  end
end
