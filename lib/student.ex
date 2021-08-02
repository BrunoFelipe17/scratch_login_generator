defmodule ScratchLoginGenerator.Student do
  def get_first_letter(name) do
    String.at(name, 0)
  end

  def get_last_name([head | []]) do
    head
  end

  def get_last_name([_head | tail]) do
    get_last_name(tail)
  end

  def full_name(full_name), do: full_name
end
