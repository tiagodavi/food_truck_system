defmodule FoodTruckSystem.Schema.Restaurant do
  @moduledoc """
  It represents a food truck restaurant
  """

  alias NimbleCSV.RFC4180, as: CSV

  defstruct [:id, :name, :location, :address, :food, :lat, :lng, :availability]

  @type t :: %__MODULE__{}

  @limit 12

  @spec new(params :: keyword()) :: t()
  def new(params) do
    struct(%__MODULE__{}, params)
  end

  @spec load(search :: String.t()) :: list(t())
  def load(search) when is_binary(search) do
    parse_csv()
    |> Stream.filter(&filter(&1, search))
    |> Enum.shuffle()
  end

  def load do
    parse_csv()
    |> Stream.take(@limit)
    |> Enum.shuffle()
  end

  defp parse_csv do
    "priv/data/Mobile_Food_Facility_Permit.csv"
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.map(&build_restaurant/1)
  end

  defp build_restaurant([
         id,
         name,
         _,
         _,
         location,
         address,
         _,
         _,
         _,
         _,
         _,
         food,
         _,
         _,
         lat,
         lng,
         _,
         availability | _tail
       ]) do
    new(
      id: :binary.copy(id),
      name: :binary.copy(name),
      location: :binary.copy(location),
      address: :binary.copy(address),
      food: :binary.copy(food),
      lat: :binary.copy(lat),
      lng: :binary.copy(lng),
      availability: :binary.copy(availability)
    )
  end

  defp filter(restaurant, search) do
    cond do
      String.contains?(String.downcase(restaurant.food), search) -> true
      String.contains?(String.downcase(restaurant.name), search) -> true
      String.contains?(String.downcase(restaurant.location), search) -> true
      String.contains?(String.downcase(restaurant.address), search) -> true
      true -> false
    end
  end
end
