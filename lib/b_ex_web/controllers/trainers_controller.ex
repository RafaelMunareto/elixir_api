defmodule BExWeb.TrainersController do
  use BExWeb, :controller
  action_fallback BExWeb.FallbackController

  def create(conn, params) do
    params
    |> BEx.create_trainer()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> BEx.delete_trainer()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> BEx.fetch_trainer()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, trainer}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, %{trainer: trainer})
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
