defmodule PortfolioWeb.HomeLive do
    use PortfolioWeb, :live_view

    def mount(_params, _session, socket) do
        socket = 
            assign(
                socket, 
                ph_portfolio: "Precious Hamilton Portfolio"
                )

        {:ok, socket}
    end

    def render(assigns) do
        ~H"""
            <h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-5xl md:text-6xl p-6">
                <span class="block">    
                    <span class="text-transparent bg-clip-text bg-gradient-to-tr to-orange-500 from-blue-600">
                        <%= @ph_portfolio%>
                    </span>
                </span>
            </h1>
        """
    end





end