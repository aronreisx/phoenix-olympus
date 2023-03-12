defmodule Olympus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Olympus.Repo,
      # Start the Telemetry supervisor
      OlympusWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Olympus.PubSub},
      # Start the Endpoint (http/https)
      OlympusWeb.Endpoint
      # Start a worker by calling: Olympus.Worker.start_link(arg)
      # {Olympus.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Olympus.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OlympusWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
