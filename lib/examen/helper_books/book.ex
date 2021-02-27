defmodule Examen.HelperBooks.Book do
  use Ecto.Schema
  alias Examen.HelperAuthors.Author
  alias Examen.HelperLibraries.Library

  import Ecto.Changeset

  schema "books" do
    field :isbn, :string
    field :name, :string
    belongs_to :library, Library
    belongs_to :author, Author
    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:author_id, :library_id, :name, :isbn])
    |> validate_required([:author_id, :library_id, :name, :isbn])
    |> assoc_constraint(:library)
    |> assoc_constraint(:author)
  end
end
