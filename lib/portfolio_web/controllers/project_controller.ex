defmodule PortfolioWeb.ProjectController do
  use PortfolioWeb, :controller

  alias Portfolio.Who_are_you.Questions

  def new(conn, _params) do
    changeset = Questions.changeset(%Questions{}, %{})
    render(conn, :new, changeset: changeset)
  end

end