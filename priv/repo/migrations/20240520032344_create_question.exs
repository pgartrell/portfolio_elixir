defmodule Portfolio.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:question) do
      add :query, :string
      add :answer, :string

      timestamps(type: :utc_datetime)
    end
  end
end
