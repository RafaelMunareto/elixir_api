defmodule BEx do
 alias BEx.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
end
