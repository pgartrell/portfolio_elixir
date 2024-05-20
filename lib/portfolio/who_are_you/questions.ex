defmodule Portfolio.Who_are_you.Questions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "question" do
    field :answer, :string
    field :query, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(questions, attrs) do
    questions
    |> cast(attrs, [:query, :answer])
    |> validate_required([:query, :answer])
  end
end
