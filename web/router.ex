defmodule ZooInventory.Router do
  use ZooInventory.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ZooInventory do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", AboutController, :index
    get "/about/:entity", AboutController, :entity

    resources "/animals", AnimalController
  end

  scope "/api", ZooInventory.Api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/animals", AnimalController
    end
  end
end
