defmodule ZooInventory.Repo.Migrations.CreateAnimal do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :friendly_name, :string
      add :kingdom, :string
      add :phylum, :string
      add :class, :string
      add :order, :string
      add :family, :string
      add :genus, :string
      add :species, :string

      timestamps
    end

  end
end
