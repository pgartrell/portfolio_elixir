defmodule PortfolioWeb.ProjectsLive do
    use PortfolioWeb, :live_view

    alias Portfolio.Who_are_you
    alias Portfolio.Who_are_you.Questions

    def mount(_params, _session, socket) do
        socket = 
            assign(
                socket, 
                    table_title: "Ask me a Question",
                    changeset: Who_are_you.change_questions(%Questions{}),
                    questions: Who_are_you.list_question(),
                    query: %Questions{}
                )

        {:ok, fetch(socket)}
    end


    def handle_event("create", %{"questions" => %{"query" => query}}, socket) do
        Who_are_you.create_questions(%{query: query})

        {:noreply, fetch(socket)}
    end

    def handle_event("delete_question", %{"id" => id}, socket) do
        questions = Who_are_you.list_question
        question = Who_are_you.get_questions!(id)

        with {:ok, deleted_question} <- Who_are_you.delete_questions(question) do
            questions = Enum.filter(questions, fn question -> question.id != deleted_question.id end)

            socket = assign(socket, :questions, questions)
            {:noreply, socket}
        end
    end

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
                <div  class="relative flex flex-col w-full h-full overflow-scroll text-gray-700 bg-white shadow-md rounded-xl bg-clip-border">
                    <table  class="w-full text-left table-auto min-w-max">
                        <thead>
                        <tr>
                            <th class="p-4 border-b border-blue-gray-100 bg-blue-gray-50">
                                <p class="block font-sans text-sm antialiased font-normal leading-none text-blue-gray-900 opacity-70">
                                    Question
                                </p>
                            </th>
                            <th class="p-4 border-b border-blue-gray-100 bg-blue-gray-50">
                                <p class="block font-sans text-sm antialiased font-normal leading-none text-blue-gray-900 opacity-70">
                                    Answer
                                </p>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>             
                                
                                    <%= for question <- @questions do%>
                                    <td class="p-4 border-b border-blue-gray-50">
                                        <div id={"question-#{question.id}"}>
                                            <p class="question_item">
                                            <%= question.query %>
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                    <button 
                                        class="delete_btn"
                                        phx-click="delete_question"
                                        phx-value-id={question.id}
                                    
                                    >
                                        Delete
                                    </button>
                                     </td>
                                    <% end %>
                               
                            </tr>
                        </tbody>
                    </table>
                </div>
            </h1>
        """
    end





end