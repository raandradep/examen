# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Examen.Repo.insert!(%Examen.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Examen.Repo.insert!(%Autor{nombre: "Ramiro", apellidos: "Andrade", email: "randrade@email.com"})
Examen.Repo.insert!(%Autor{nombre: "Pepito", apellidos: "perez", email: "pperez@email.com"})

Examen.Repo.insert!(%Biblioteca{codigo: "B0001", nombre: "Biblioteca Departamental"})
Examen.Repo.insert!(%Biblioteca{codigo: "B0002", apellidos: "Biblioteca del Norte"})

Examen.Repo.insert!(%Libro{codigo: "L0001", id_biblioteca: 1, id_autor:1,  titulo: "Matematicas Basica", ISBN: "SD87434334", editorial: "Editorial Acme", numpags: 556})
Examen.Repo.insert!(%Libro{codigo: "L0002", id_biblioteca: 2, id_autor: 2, titulo: "Algebra Lineas", ISBN:  "SD8753434", editorial: "Editorial Acme", numpags: 600})
