defmodule OlympusWeb.IMCController do
  use OlympusWeb, :controller

  alias Olympus.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
  end

  def handle_response({:ok, result}, conn) do
    render_response(conn, result, :ok)
  end

  def handle_response({:error, result}, conn) do
    render_response(conn, result, :bad_request)
  end

  defp render_response(conn, result, status) do
    conn
    |> put_status(status)
    |> json(%{result: result})
  end
end
