defmodule BEx.TrainersView do
  use BExWeb, :view

  alias BEx.Trainer

  def render("create.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "Trainer create!",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end
end
