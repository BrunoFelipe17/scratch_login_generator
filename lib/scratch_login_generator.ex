defmodule ScratchLoginGenerator do
  alias ScratchLoginGenerator.{Login, Parser, Student}

  @moduledoc """
  Documentation for `ScratchLoginGenerator`.
  """

  @doc """
  Given a csv file with the students name, saves in a file the students login

  ## Examples
      # With a file with a student "Lorem Ipsum Dolor", returns "ldolor123" and a random password
      iex> ScratchLoginGenerator.build(filename)
      {:ok, "Logins created successfully"}

  """

  def build(filename) do
    login_list = create_students_login(filename)
    generate_csv(filename, login_list)
  end

  def build_from_many(filenames) do
    filenames
      |> Task.async_stream(&build/1)
      |> Enum.map(& &1)

  end

  defp create_students_login(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.map(fn full_name -> create_login(full_name) end)
  end

  defp create_login(full_name) do
    [head | tail] =
      full_name
      |> String.downcase()
      |> String.split(" ")

    first_letter = Student.get_first_letter(head)

    last_name = Student.get_last_name(tail)

    Login.generate(first_letter, last_name)
  end

  defp generate_csv(filename, content) do
    File.write("#{filename}_logins.csv", content)
    {:ok, "Logins created successfully"}
  end
end
