defmodule ExRdf.Literal do
  defstruct [:value, :datatype, :lang]

  def valid?(%ExRdf.Literal{value: nil}), do: false
  # Always a language typed string.
  def valid?(%ExRdf.Literal{value: _, datatype: nil, lang: _}), do: true
  def valid?(_), do: false
end
