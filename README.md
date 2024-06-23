
# Tools

This project has been created with Elixir and Phoenix so you need to have them installed before using it.

# FoodTruckSystem

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000/tracker`](http://localhost:4000/tracker) from your browser.

## Setup

 This project loads food truck restaurants from a `CSV` file in memory with the module `FoodTruckSystem.Schema.Restaurant`.

`FoodTruckSystemWeb.TrackerLive` is a LiveView module that gets the restaurants and send them to a live view page where the
user can search for new restaurants in real time. 

## TradeOffs

- This is a simple project that loads the CSV file everytime we need it, in a real project it's much better to run it only once and store the data into a database with the proper indexes. I could go beyond that and convert the text content into embeddings and store them with the pg_vector plugin for postgres or a vector database, this way I could use similarity search to find restaurants by context, for example `spicy` could return a mexican restaurant even if there was not the word `spicy` anywhere.

Something like that: https://qdrant.tech/articles/food-discovery-demo

- I would remove the sample pages that comes with phoenix by default. 

- I would add more tests for more scenarios, empty list, weird params and successful cases.

- I would add a map on the page so the user could easily find near restaurants by enabling their location or calculate the distance from a point to the desire restaurant.  

- I would design and improve the layout on Figma and would make it reponsive.

- I could create a REST or GraphQL API and use it instead of the web page directly, this
way I could use the same api for a future mobile app. 

## Video with the app working

 https://www.loom.com/share/bd787c5fe4e04e1da55020a00bd1d79e?sid=c6519d6d-bcd6-4d95-aae7-1deb1fd33707








