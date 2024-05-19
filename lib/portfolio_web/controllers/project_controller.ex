defmodule PortfolioWeb.ProjectController do
  use PortfolioWeb, :controller

  def new(conn, _params) do

    render(conn, :new)
  end
end