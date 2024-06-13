defmodule PortfolioWeb.ProjectsLive do
    use PortfolioWeb, :live_view

    alias Portfolio.Who_are_you
    alias Portfolio.Who_are_you.Questions

    def mount(_params, _session, socket) do
        socket = 
            assign(
                socket, 
                    table_title: "Ask me a Question",
                    changeset: Who_are_you.change_questions(%Questions{})
                )

        {:ok, socket}
    end

    def render(assigns) do
        ~H"""
            <h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-5xl md:text-6xl p-6">
                <span class="block"> 
                    <%= @table_title%>   
                    <span class="text-transparent bg-clip-text bg-gradient-to-tr to-orange-500 from-blue-600">
                        <.form :let={f} for={@changeset} action={~p"/projects"}>
                            <div class="form-group">
                                <.input field={f[:title]} placeholder="Ask your question here" class="form-control" />
                            </div>
                            <button type="submit" class="btn btn-primary"> Save Topic </button>
                        </.form>
                    </span>
                </span>
            </h1>
        """
    end





end