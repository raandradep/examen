defmodule Examen.HelperAuthorsTest do
  use Examen.DataCase
  alias Examen.HelperAuthors.Author
  alias Examen.HelperAuthors

  describe "authors" do
    setup do

      author = insert(:author)
      #librarie = insert(:librarie)
      #insert(:book, authors_id: author, libraries_id: librarie)
      {:ok, author: author}

    end

    test "get_author", %{author: author} do
           assert HelperAuthors.get_author!(author.id) == author
    end


    test "delete_author/1 deletes the author", %{author: author} do
      assert {:ok, %Author{}} = HelperAuthors.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> HelperAuthors.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset", %{author: author} do
        assert %Ecto.Changeset{} = HelperAuthors.change_author(author)
    end


    test "list_authors/0 returns all authors", %{author: author} do
      assert HelperAuthors.list_authors() == [author]
    end





    # test "create_author/1 with valid data creates a author" do
    #   assert {:ok, %Author{} = author} = HelperAuthors.create_author(@valid_attrs)
    #   assert author.age == 42
    #   assert author.email == "some email"
    #   assert author.first_name == "some first_name"
    #   assert author.last_name == "some last_name"
    # end

    # test "create_author/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = HelperAuthors.create_author(@invalid_attrs)
    # end

    # test "update_author/2 with valid data updates the author" do
    #   author = author_fixture()
    #   assert {:ok, %Author{} = author} = HelperAuthors.update_author(author, @update_attrs)
    #   assert author.age == 43
    #   assert author.email == "some updated email"
    #   assert author.first_name == "some updated first_name"
    #   assert author.last_name == "some updated last_name"
    # end

    # test "update_author/2 with invalid data returns error changeset" do
    #   author = author_fixture()
    #   assert {:error, %Ecto.Changeset{}} = HelperAuthors.update_author(author, @invalid_attrs)
    #   assert author == HelperAuthors.get_author!(author.id)
    # end

    # test "delete_author/1 deletes the author" do
    #   author = author_fixture()
    #   assert {:ok, %Author{}} = HelperAuthors.delete_author(author)
    #   assert_raise Ecto.NoResultsError, fn -> HelperAuthors.get_author!(author.id) end
    # end

    # test "change_author/1 returns a author changeset" do
    #   author = author_fixture()
    #   assert %Ecto.Changeset{} = HelperAuthors.change_author(author)
    # end
  end
end
