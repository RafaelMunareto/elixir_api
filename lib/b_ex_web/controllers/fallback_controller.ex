defmodule BExWeb.FallbackController do
  use BExWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(BExWeb.ErrorView)
    |> render("401.json", message: "Trainer unauthorized")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(BExWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
