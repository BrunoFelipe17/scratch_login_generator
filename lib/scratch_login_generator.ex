defmodule ScratchLoginGenerator do
  alias ScratchLoginGenerator.{Login, Parser, Student}

  @moduledoc """
  Documentation for `ScratchLoginGenerator`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ScratchLoginGenerator.hello()
      :world

  """

  def build(filename) do
    login_list = create_students_login(filename)
    File.write("reports/logins.csv", login_list)
  end

  defp create_students_login(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.map(fn line -> create_login(line) end)
  end

  defp create_login(line) do
    [head | tail] =
      line
      |> String.downcase()
      |> String.split(" ")

    first_letter = Student.get_first_letter(head)

    last_name = Student.get_last_name(tail)

    Login.generate(first_letter, last_name)
  end
end
