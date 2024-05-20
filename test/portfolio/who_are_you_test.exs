defmodule Portfolio.Who_are_youTest do
  use Portfolio.DataCase

  alias Portfolio.Who_are_you

  describe "question" do
    alias Portfolio.Who_are_you.Questions

    import Portfolio.Who_are_youFixtures

    @invalid_attrs %{answer: nil, query: nil}

    test "list_question/0 returns all question" do
      questions = questions_fixture()
      assert Who_are_you.list_question() == [questions]
    end

    test "get_questions!/1 returns the questions with given id" do
      questions = questions_fixture()
      assert Who_are_you.get_questions!(questions.id) == questions
    end

    test "create_questions/1 with valid data creates a questions" do
      valid_attrs = %{answer: "some answer", query: "some query"}

      assert {:ok, %Questions{} = questions} = Who_are_you.create_questions(valid_attrs)
      assert questions.answer == "some answer"
      assert questions.query == "some query"
    end

    test "create_questions/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Who_are_you.create_questions(@invalid_attrs)
    end

    test "update_questions/2 with valid data updates the questions" do
      questions = questions_fixture()
      update_attrs = %{answer: "some updated answer", query: "some updated query"}

      assert {:ok, %Questions{} = questions} = Who_are_you.update_questions(questions, update_attrs)
      assert questions.answer == "some updated answer"
      assert questions.query == "some updated query"
    end

    test "update_questions/2 with invalid data returns error changeset" do
      questions = questions_fixture()
      assert {:error, %Ecto.Changeset{}} = Who_are_you.update_questions(questions, @invalid_attrs)
      assert questions == Who_are_you.get_questions!(questions.id)
    end

    test "delete_questions/1 deletes the questions" do
      questions = questions_fixture()
      assert {:ok, %Questions{}} = Who_are_you.delete_questions(questions)
      assert_raise Ecto.NoResultsError, fn -> Who_are_you.get_questions!(questions.id) end
    end

    test "change_questions/1 returns a questions changeset" do
      questions = questions_fixture()
      assert %Ecto.Changeset{} = Who_are_you.change_questions(questions)
    end
  end
end
