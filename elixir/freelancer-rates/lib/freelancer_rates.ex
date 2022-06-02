defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: (hourly_rate * 8)/1

  def apply_discount(before_discount, discount), do: before_discount - (discount/100*before_discount)

  def monthly_rate(hourly_rate, discount), do: hourly_rate |> daily_rate() |> Kernel.*(22) |> apply_discount(discount) |> Kernel.ceil()

  def days_in_budget(budget, hourly_rate, discount), do: (budget * 22 / monthly_rate(hourly_rate, discount)) |> Float.floor(1)
end
