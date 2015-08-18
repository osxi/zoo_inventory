defmodule ZooInventory.AnimalController do
  use ZooInventory.Web, :controller

  alias ZooInventory.Animal

  plug :scrub_params, "animal" when action in [:create, :update]

  def index(conn, _params) do
    animals = Repo.all(Animal)
    render(conn, "index.html", animals: animals)
  end

  def new(conn, _params) do
    changeset = Animal.changeset(%Animal{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"animal" => animal_params}) do
    changeset = Animal.changeset(%Animal{}, animal_params)

    case Repo.insert(changeset) do
      {:ok, _animal} ->
        conn
        |> put_flash(:info, "Animal created successfully.")
        |> redirect(to: animal_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    animal = Repo.get!(Animal, id)
    render(conn, "show.html", animal: animal)
  end

  def edit(conn, %{"id" => id}) do
    animal = Repo.get!(Animal, id)
    changeset = Animal.changeset(animal)
    render(conn, "edit.html", animal: animal, changeset: changeset)
  end

  def update(conn, %{"id" => id, "animal" => animal_params}) do
    animal = Repo.get!(Animal, id)
    changeset = Animal.changeset(animal, animal_params)

    case Repo.update(changeset) do
      {:ok, animal} ->
        conn
        |> put_flash(:info, "Animal updated successfully.")
        |> redirect(to: animal_path(conn, :show, animal))
      {:error, changeset} ->
        render(conn, "edit.html", animal: animal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    animal = Repo.get!(Animal, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(animal)

    conn
    |> put_flash(:info, "Animal deleted successfully.")
    |> redirect(to: animal_path(conn, :index))
  end
end
