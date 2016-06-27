defmodule GraphTest do
  use ExUnit.Case, async: true
  alias ExRdf.Graph
  setup do
    graph = 
      {:subject, %{
          "http://1.com" => {
            :predicate, %{"http://1.com/a" => MapSet.new(["test", "test1"])}
          }
        }
      }
    graph2 = 
      {:subject, %{
          "http://1.com" => {
            :predicate, %{"http://1.com/b" => MapSet.new(["test2"]), "http://1.com/a" =>
              MapSet.new(["test1"])}
          }
        }
      }
    {:ok, graph: graph, graph2: graph2}
  end

  test "merging two graphs", %{graph: graph, graph2: graph2} do
    result = Graph.merge(graph, graph2)

    assert result ==
      {:subject, %{
          "http://1.com" => {
            :predicate, %{
              "http://1.com/b" => MapSet.new(["test2"]),
              "http://1.com/a" => MapSet.new(["test", "test1"])
            }
          }
        }
      }
  end

  test "size", %{graph2: graph} do
    assert Graph.size(graph) == 2
  end
end
