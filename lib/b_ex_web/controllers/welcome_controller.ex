defmodule BExWeb.WelcomeController do
  use BExWeb, :controller

  def index(conn, _params) do
    text(conn, "Hello World")
  end

end
