defmodule ZooInventory.Animal do
  use ZooInventory.Web, :model

  schema "animals" do
    field :friendly_name, :string
    field :kingdom, :string
    field :phylum, :string
    field :class, :string
    field :order, :string
    field :family, :string
    field :genus, :string
    field :species, :string

    timestamps
  end

  @required_fields ~w(friendly_name kingdom phylum class order family genus species)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
