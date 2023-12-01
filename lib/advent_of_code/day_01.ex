defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> String.split("\n")
    |> Stream.map(fn e ->
      e |> String.codepoints() |> get_number1(nil, nil)
    end)
    |> Enum.reduce(0, &(&2 + &1))
  end

  defp get_number1([], first, last) do
    last = if is_nil(last), do: first, else: last
    case Integer.parse("#{first}#{last}") do
      :error -> 0
      {n, _rest} -> n
    end
  end

  defp get_number1([c | rest], first, last) do
    case Integer.parse(c) do
      :error -> get_number1(rest, first, last)
      {n, _} -> if is_nil(first), do: get_number1(rest, n, last), else: get_number1(rest, first, n)
    end
  end

  def part2(args) do
    args
    |> String.split("\n")
    |> Stream.map(fn e ->
      e |> String.codepoints() |> get_number2(nil, nil)
    end)
    |> Enum.reduce(0, &(&2 + &1))
  end

  defp get_number2([], first, last) do
    last = if is_nil(last), do: first, else: last
    case Integer.parse("#{first}#{last}") do
      :error -> 0
      {n, _rest} -> n
    end
  end

  defp get_number2(["o", "n", "e" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 1, last), else: get_number2(rest, first, 1)
  end

  defp get_number2(["t", "w", "o" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 2, last), else: get_number2(rest, first, 2)
  end

  defp get_number2(["t", "h", "r", "e", "e" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 3, last), else: get_number2(rest, first, 3)
  end

  defp get_number2(["f", "o", "u", "r" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 4, last), else: get_number2(rest, first, 4)
  end

  defp get_number2(["f", "i", "v", "e" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 5, last), else: get_number2(rest, first, 5)
  end

  defp get_number2(["s", "i", "x" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 6, last), else: get_number2(rest, first, 6)
  end

  defp get_number2(["s", "e", "v", "e", "n" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 7, last), else: get_number2(rest, first, 7)
  end

  defp get_number2(["e", "i", "g", "h", "t" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 8, last), else: get_number2(rest, first, 8)
  end

  defp get_number2(["n", "i", "n", "e" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 9, last), else: get_number2(rest, first, 9)
  end

  defp get_number2(["z", "e", "r", "o" | rest], first, last) do
    if is_nil(first), do: get_number2(rest, 0, last), else: get_number2(rest, first, 0)
  end

  defp get_number2([c | rest], first, last) do
    case Integer.parse(c) do
      :error -> get_number2(rest, first, last)
      {n, _} -> if is_nil(first), do: get_number2(rest, n, last), else: get_number2(rest, first, n)
    end
  end
end
