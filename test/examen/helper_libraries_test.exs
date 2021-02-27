defmodule Examen.HelperLibrariesTest do
  use Examen.DataCase

  alias Examen.HelperLibraries
  alias Examen.HelperLibraries.Library

  describe "libraries" do

    setup do

      library = insert(:librarie)
      {:ok, library: library}

    end



    test "list_libraries/0 returns all libraries", %{library: library} do
      assert HelperLibraries.list_libraries() == [library]
    end

    test "get_library!/1 returns the library with given id", %{library: library} do
      assert HelperLibraries.get_library!(library.id) == library
    end

    test "create_library/1 with valid data creates a library" do

      library = %{name: "Library central", address: " Av 6"}
      assert {:ok, %Library{} = libraryres} = HelperLibraries.create_library(library)
      assert libraryres.address == library.address
      assert libraryres.name == library.name
    end

    test "create_library/1 with invalid data returns error changeset" do
      library = %{}
      assert {:error, %Ecto.Changeset{}} = HelperLibraries.create_library(library)
    end

    test "update_library/1 with valid data updates the library",  %{library: library}  do
      librarymap = %{name: "Library central", address: " Av 6"}
      assert {:ok, %Library{} = libraryres} = HelperLibraries.update_library(library, librarymap)
      assert libraryres.address == librarymap.address
      assert libraryres.name == librarymap.name
    end



    test "delete_library/1 deletes the library",  %{library: library} do
      assert {:ok, %Library{}} = HelperLibraries.delete_library(library)
      assert_raise Ecto.NoResultsError, fn -> HelperLibraries.get_library!(library.id) end
    end

    test "change_library/1 returns a library changeset",  %{library: library} do
      assert %Ecto.Changeset{} = HelperLibraries.change_library(library)
    end
  end
end
