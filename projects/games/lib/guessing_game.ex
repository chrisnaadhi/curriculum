defmodule Games.GuessingGame do
  def play() do
    getNumber = getRandomNumber()
    IO.puts("Guessing Game!")
    Games.GuessingGame.guess(getNumber)
  end

  def getRandomNumber() do
    Enum.random(1..10)
  end

  def guess(number) do
    answer = IO.gets("Masukkan Angka : ")
    {parse_answer, _n} = Integer.parse(answer)

    cond do
      parse_answer < number ->
        IO.puts("Too Low! Try Again...")
        guess(number)

      parse_answer > number ->
        IO.puts("Too High! Try Again...")
        guess(number)

      true ->
        IO.puts("Correct! #{number}")
    end
  end
end
