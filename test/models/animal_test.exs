defmodule ZooInventory.AnimalTest do
  use ZooInventory.ModelCase

  alias ZooInventory.Animal

  @valid_attrs %{class: "some content", family: "some content", friendly_name: "some content", genus: "some content", kingdom: "some content", order: "some content", phylum: "some content", species: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Animal.changeset(%Animal{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Animal.changeset(%Animal{}, @invalid_attrs)
    refute changeset.valid?
  end
end
