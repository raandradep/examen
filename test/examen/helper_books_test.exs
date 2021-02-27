defmodule Examen.HelperBooksTest do
  use Examen.DataCase

  alias Examen.HelperBooks
  alias Examen.HelperBooks.Book
  import Examen.Factory

  describe "books" do

    setup do
      author = insert(:author)
      librarie = insert(:librarie)
      book = insert(:book, author: author, library: librarie)
      {:ok, book: book, author: author, librarie: librarie}

    end

    test "list_books/1 returns all books", %{book: book } do
         assert  HelperBooks.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id", %{book: book} do
      assert  HelperBooks.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book", %{author: author, librarie: librarie} do
      bookmap = %{name: "libro", isbn: "SD545646",author_id: author.id, library_id: librarie.id }

      assert {:ok, %Book{} = bookres} = HelperBooks.create_book(bookmap)
      assert bookres.isbn == bookmap.isbn
      assert bookres.name == bookmap.name
    end

    test "create_book/1 with invalid data returns error changeset" do
      bookmap = %{exists: "no existe"}
      assert {:error, %Ecto.Changeset{}} = HelperBooks.create_book(bookmap)
    end

    test "delete_book/1 deletes the book" , %{book: book} do
      assert {:ok, %Book{}} = HelperBooks.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> HelperBooks.get_book!(book.id) end
    end


    test "change_book/1 returns a book changeset", %{book: book} do
      assert %Ecto.Changeset{} = HelperBooks.change_book(book)
    end



    test "update_book/2 with valid data updates the book", %{book: book} do
      bookmap = %{name: "libro update", isbn: "SD635"}
      assert {:ok, %Book{} = book} = HelperBooks.update_book(book, bookmap)
      assert book.isbn == bookmap.isbn
      assert book.name == bookmap.name
    end



  end
end
