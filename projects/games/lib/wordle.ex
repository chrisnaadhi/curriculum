defmodule Games.Wordle do
  @words [
    "apple",
    "beats",
    "hello",
    "toast"
  ]
  @type color :: :green | :grey | :yellow
  @type colors :: [color]

  def play(answer \\ nil, attempt \\ 1) do
    answer = answer || Enum.random(@words)
    guess = IO.gets("Guess a five-letter word: ") |> String.trim()

    cond do
      answer == guess ->
        Games.ScoreTracker.add_points(25)
        IO.puts("You win!")

      attempt == 6 ->
        IO.puts("You lose! The answer was #{answer}!")

      true ->
        feedback(answer, guess)
        |> colored_feedback(guess)
        |> IO.puts()

        play(answer, attempt + 1)
    end
  end

  def colored_feedback(colors, guess) do
    colored_text =
      Enum.zip(colors, String.split(guess, "", trim: true))
      |> Enum.map(fn
        {:green, char} -> IO.ANSI.green() <> char
        {:yellow, char} -> IO.ANSI.yellow() <> char
        {:grey, char} -> IO.ANSI.light_black() <> char
      end)
      |> Enum.join("")

    colored_text <> IO.ANSI.reset()
  end

  def feedback(answer, guess) do
    answer_word = answer |> String.split("", trim: true)
    guess_word = guess |> String.split("", trim: true)

    {answer_word, guess_word}
    |> replace_greens()
    |> replace_yellows()
    |> replace_greys()
    |> elem(1)
  end

  defp replace_greens({answer, guess}) do
    Enum.zip(answer, guess)
    |> Enum.map(fn
      {same, same} ->
        {nil, :green}

      non_green ->
        non_green
    end)
    |> Enum.unzip()
  end

  defp replace_yellows({answer, guess}) do
    Enum.reduce(guess, {answer, guess}, fn
      guess_char, {answer_acc, guess_acc} ->
        answer_index =
          Enum.find_index(answer_acc, fn answer_char -> answer_char == guess_char end)

        guess_index = Enum.find_index(guess_acc, fn char -> char == guess_char end)

        if answer_index do
          updated_answer_acc = List.replace_at(answer_acc, answer_index, nil)
          updated_guess_acc = List.replace_at(guess_acc, guess_index, :yellow)
          {updated_answer_acc, updated_guess_acc}
        else
          {answer_acc, guess_acc}
        end
    end)
  end

  defp replace_greys({answer, guess}) do
    # assumes yellows and greens have already been removed
    Enum.zip(answer, guess)
    |> Enum.map(fn
      {_, :green} ->
        {nil, :green}

      {_, :yellow} ->
        {nil, :yellow}

      _ ->
        {nil, :grey}
    end)
    |> Enum.unzip()
  end
end
