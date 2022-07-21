defmodule BEx.Trainer.Get do
  alias BEx.{Trainer, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found!"}
      trainer -> {:ok, trainer}
    end
  end
end
