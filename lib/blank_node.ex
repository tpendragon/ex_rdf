defmodule ExRdf.BlankNode do
  defstruct [:id]

  def new, do: %__MODULE__{id: generate_id()}

  def generate_id, do: UUID.uuid4(:hex)
end
