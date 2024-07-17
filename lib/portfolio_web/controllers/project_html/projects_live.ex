defmodule PortfolioWeb.ProjectsLive do
    use PortfolioWeb, :live_view

    alias Portfolio.Who_are_you
    alias Portfolio.Who_are_you.Questions

    # @topic "live"

    def mount(_params, _session, socket) do
        socket = 
            assign(
                socket, 
                    table_title: "Ask me a Question",
                    changeset: Who_are_you.change_questions(%Questions{}),
                    questions: Who_are_you.list_question(),
                    query: %Questions{},
                )

        {:ok, fetch(socket)}
    end

    # def handle_event("create", %{"query" => query}, socket) do
    #     Who_are_you.create_questions(%{query: query})
    #     socket = assign(socket, questions: Who_are_you.list_question(), active: %Questions{})
    #     LiveViewTodoWeb.Endpoint.broadcast_from(self(), @topic, "update", socket.assigns)
    #     IO.inspect(socket)
    #     {:noreply, socket}
    # end

    def handle_event("create", %{"questions" => %{"query" => query}}, socket) do
        Who_are_you.create_questions(%{query: query})

        {:noreply, fetch(socket)}
    end

    # @impl true
    # def handle_info(%{event: "update", payload: %{questions: questions}}, socket) do
    #     {:noreply, assign(socket, questions: questions)}
    # end

    def fetch(socket) do
        assign(socket, questions: Who_are_you.list_question())
    end

    def render(assigns) do
        ~H"""
            <h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-5xl md:text-6xl p-6">
                <span class="block"> 
                    <%= @table_title%>   
                    <span class="text-transparent bg-clip-text bg-gradient-to-tr to-orange-500 from-blue-600">
                        <.form phx-submit="create" :let={f} for={@changeset} action={~p"/projects"}>
                            <div class="form-group">
                                <.input field={f[:query]} placeholder="Ask your question here" class="form-control" />
                            </div>
                            <button class="btn btn-primary"> Save Topic </button>
                        </.form>
                    </span>
                </span>
                <div>
                    <ul>
                        <%= for question <- @questions do%>
                            <li id={"question-#{question.id}"}>
                                <p class="question_item">
                                <%= question.query %>
                                </p>
                                <button class="delete_btn">
                                Delete
                                </button>
                            </li>
                        <% end %>
                    </ul>
                </div>
            </h1>
        """
    end





end