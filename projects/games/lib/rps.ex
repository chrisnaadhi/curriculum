defmodule Games.Rps do
  def bot_choice() do
    Enum.random(["rock", "paper", "scissors"])
  end

  def rps_handler?(guess1, guess2) do
    case {guess1, guess2} do
      {"rock", "scissors"} -> true
      {"paper", "rock"} -> true
      {"scissors", "paper"} -> true
      _answer -> false
    end
  end

  def battle_handler(bot, player) do
    cond do
      rps_handler?(player, bot) ->
        "You Win! Your Choice: #{player} | Bot Choice: #{bot}"

      rps_handler?(bot, player) ->
        "You Lose! Your Choice: #{player} | Bot Choice: #{bot}"

      true ->
        "You're tied with the Bot with #{bot} - #{player}!"
    end
  end

  def play() do
    get_bot_choice = bot_choice()

    player_choice =
      IO.gets("Choose: Rock | Paper | Scissors : ") |> String.downcase() |> String.trim()

    case player_choice in ["rock", "paper", "scissors"] do
      true ->
        battle_handler(get_bot_choice, player_choice)

      false ->
        "You're not picking one of : Rock | Paper | Scissors. Please try again!"
    end
  end
end
