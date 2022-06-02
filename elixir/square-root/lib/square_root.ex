defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
   nth_root(radicand, 2)
  end

  defp nth_root(x, n) do
    nth_root(x, n, x / 2.0)
  end

  # Helper function; given estimate for x^n,
  # recursively calculates next estimated root as
  # estimate - (estimate^n - x) / (n * estimate^(n-1))
  # until the next estimate is within a limit of previous estimate.

  defp nth_root(x, n, estimate) do
    IO.puts("Current guess is #{estimate}")
    f = pow(estimate, n) - x
    f_prime = n * pow(estimate, n - 1)
    next = estimate - f / f_prime
    change = abs(estimate - next)
    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end


  defp pow(_, 0) do
    1
  end

  defp pow(x, n) when n < 0 do
    1.0 / pow(x, -n)
  end

  defp pow(x, n) when n > 0 do
    pow(x, n, 1)
  end

  # Helper function: counts down from n to 0,
  # multiplying the accumulator by x each time.
  # Returns the accumulator when n reaches zero.

  @spec pow(number(), number(), number()) :: number()

  defp pow(_x, 0, accumulator) do
    accumulator
  end

  defp pow(x, n, accumulator) do
    pow(x, n - 1, x * accumulator)
  end




end
