defmodule ZooInventory.Api.V1.AnimalController do
  use ZooInventory.Web, :controller

  alias ZooInventory.Animal

  def index(conn, _params) do
    animals = Repo.all(Animal)
    render conn, animals: animals
  end
end
