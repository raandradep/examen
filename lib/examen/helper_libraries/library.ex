defmodule Examen.HelperLibraries.Library do
  use Ecto.Schema

  alias Examen.HelperBooks.Book
  import Ecto.Changeset

  schema "libraries" do
    field :address, :string
    field :name, :string
    has_many :books, Book
    timestamps()
  end

  @doc false
  def changeset(library, attrs) do
    library
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
