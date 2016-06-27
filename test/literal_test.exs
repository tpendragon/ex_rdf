defmodule LiteralTest do
  use ExUnit.Case, async: true
  alias ExRdf.Literal

  test "valid cases" do
    assert Literal.valid?(%Literal{value: "Test"})
    assert Literal.valid?(%Literal{value: "Test", lang: :en})
  end

  test "invalid cases" do
    assert Literal.valid?(%Literal{}) == false
  end

end
