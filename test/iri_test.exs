defmodule IRITest do
  use ExUnit.Case, async: true
  alias ExRdf.IRI

  test "construction" do
    %IRI{id: "http://test.com"}
  end
end
