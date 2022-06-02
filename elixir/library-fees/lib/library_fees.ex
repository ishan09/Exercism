defmodule LibraryFees do
  def datetime_from_string(string) do
    case NaiveDateTime.from_iso8601(string) do
      {:ok, time} -> 
        time
      error -> 
        error
    end
  end

  def before_noon?(datetime) do
    noon = ~T[12:00:00]
    Time.diff(datetime, noon) < 0
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      Date.add(checkout_datetime, 28)
    else
      Date.add(checkout_datetime, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(actual_return_datetime,planned_return_date)
    if diff < 0 do
        0
    else
      diff
    end
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate), do:
    checkout
    |> datetime_from_string()
    |> return_date()
    |> days_late(return|> datetime_from_string())
    |> Kernel.*(rate)
    |> (fn(total) -> 
      if monday?(return|> datetime_from_string()) do
        trunc(total/2)
      else 
        total
      end
     end).()
end
