defmodule ScratchLoginGenerator.Login do
  @avaiable_passwords [
    "fuzzy",
    "bear",
    "tiger",
    "kitty",
    "owl",
    "poney",
    "racoon",
    "dolphin",
    "rabbit",
    "dragon",
    "unicorn",
    "fox"
  ]

  def generate(first_letter, last_name) do
    "#{login_generator(first_letter, last_name)},#{password_generator()}\n"
  end

  defp login_generator(first_letter, last_name) do
    login =
      "#{first_letter}#{last_name}"
      |> String.normalize(:nfd)
      |> String.replace(~r/\W/u, "")

    "#{login}#{:rand.uniform(100)}"
  end

  defp password_generator() do
    "#{Enum.random(@avaiable_passwords)}#{:rand.uniform(1000)}"
  end
end
