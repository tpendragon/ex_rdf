defmodule ExRdf.Graph do
  def merge({:subject, graph = %{}}, {:subject, graph2 = %{}}) do
    { :subject, Map.merge(graph, graph2, &merge/3) }
  end

  defp merge(_, {:predicate, graph1}, {:predicate, graph2}) do
    {:predicate, Map.merge(graph1, graph2, &merge/3)}
  end
  defp merge(_, list1 = %MapSet{}, list2 = %MapSet{}) do
    MapSet.union(list1, list2)
  end

  def size({:subject, graph = %{}}) do
    size(graph)
  end
  def size({:predicate, graph = %{}}) do
    size(graph)
  end
  def size(list = %MapSet{}) do
    MapSet.size(list)
  end
  def size(graph = %{}) do
    Enum.reduce(graph, 0, fn({_, values}, acc) -> size(values) + acc end)
  end
end
