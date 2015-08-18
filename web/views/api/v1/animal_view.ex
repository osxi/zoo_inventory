defmodule ZooInventory.Api.V1.AnimalView do
  use ZooInventory.Web, :view

  def render("index.json", %{animals: animals}) do
    animals
  end
end
