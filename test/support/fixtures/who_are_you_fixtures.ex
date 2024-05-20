defmodule Portfolio.Who_are_youFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Portfolio.Who_are_you` context.
  """

  @doc """
  Generate a questions.
  """
  def questions_fixture(attrs \\ %{}) do
    {:ok, questions} =
      attrs
      |> Enum.into(%{
        answer: "some answer",
        query: "some query"
      })
      |> Portfolio.Who_are_you.create_questions()

    questions
  end
end
