defmodule BlankNodeTest do
  use ExUnit.Case, async: true
  alias ExRdf.BlankNode

  test "construction" do
    %BlankNode{id: "1234"}
  end

  test "generating UUIDs" do
    assert BlankNode.new.id
  end
end
