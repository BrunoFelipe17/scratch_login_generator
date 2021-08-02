defmodule ScratchLoginGenerator.Parser do
  def parse_file(filename) do
    "students/#{filename}.csv"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
  end
end
