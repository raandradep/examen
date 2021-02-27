defmodule Examen.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Examen.Repo
  alias Examen.HelperAuthors.Author
  alias Examen.HelperLibraries.Library
  alias Examen.HelperBooks.Book


  def author_factory do
    %Author{
      first_name: "Jane",
      last_name: "Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
      age: "30"
    }
  end

  def librarie_factory do

    %Library{
      name: sequence(:name, &"Library central #{&1}"),
      address: "Av 3th street 4"
    }

  end

  # derived factory
  def book_factory do
     %Book{
      name: " Book 1",
      isbn: "SD3354656",
      author:  build(:author),
      library:  build(:librarie)
     }
  end


end
