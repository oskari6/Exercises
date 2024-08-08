  #structs
  defmodule Membership do
    defstruct [:type, :price]
  end

defmodule Example do
  use Application
  alias UUID

  #module level attributes / constants
  @x 5

  def start(_type, _args) do
    #IO.puts(UUID.uuid4())
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)#[] child processes
  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def print_numbers(numbers) do
    numbers |> Enum.join(" ") |> IO.puts()
  end

  def main do
    #x = 5
    #IO.puts(@x)
    name = "User"
    status = Enum.random([:gold, :silver, :bronze])

    if status === :gold do
      IO.puts("Gold status, #{name}")
    else
      IO.puts("No status")
    end

    case status do
      :gold -> IO.puts("Status #{status}, user #{name}")
      :"not a member" ->("No status")
      _ -> IO.puts("Default")
    end

    time = Time.new!(16, 30, 0)
    IO.inspect(time)#inspect for multiple values
    date = Date.new!(2024, 1, 1)
    date_time = DateTime.new!(date, time, "Etc/UTC")# ! get passed compling error
    time_till = DateTime.diff(time, DateTime.utc_now())

    days = div(time_till, 86400)
    IO.puts(days)
    hours = div(rem(time_till, 86400), 60*60)
    IO.puts(hours)
    mins = div(rem(time_till, 60 * 60), 60)
    IO.puts(mins)
    seconds = rem(time_till, 60)
    IO.puts(seconds)

    IO.puts("Time until new year: #{days} days, #{hours} hours, #{mins} minutes, #{seconds} seconds.")

    #tuples
    memberships = {:bronze, :silver}
    memberships = Tuple.append(memberships, :gold)
    IO.inspect(memberships)

    prices = {1, 2, 3}
    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.puts(avg)

    IO.puts("Average price from #{elem(memberships, 0)} #{elem(memberships, 1)} #{elem(memberships, 2)} is #{avg}")
    user1 = {"user", :gold}

    #destructuring
    {name, membership} = user1

    #map
    value = %{
      gold: :gold,
      silver: :silver,
      bronze: :bronze,
      none: :none
    }
    prices2 = %{
      gold: 3,
      silver: 2,
      bronze: 3,
      none: 0
    }

    #lists
    users = [
      {"one", values.gold},
      {"two", values.silver},
      {"three", values.bronze},
    ]

    Enum.each(users, fn {name, membership} ->
      IO.puts("#{name} has a #{membership} membership")
    end)

    #structs
    gold_membership = %Membership{type: :gold, price: 1}
    silver_membership = %Membership{type: :silver, price: 2}
    bronze_membership = %Membership{type: :bronze, price: 3}
    none_membership = %Membership{type: :none, price: 0}

    #kvp
    users2 = [
      %User{name: "one", membership: values.gold},
      %User{name: "two", membership: values.silver},
      %User{name: "three", membership: values.bronze},
      %User{name: "four", membership: values.none},
    ]

    Enum.each(users2, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} has a #{membership.type} membership paying #{membership.price}")
    end)

    #method chaining
    correct = :rand.uniform(11) -1
    guess = IO.get("Guess a number between 0- 10: ") |> String.trim() #pushes input through
    IO.puts("You guessed #{guess}, correct was #{correct}")
  String.to_integer(guess)

  #list comprehension
  grades = [25, 50, 75, 100]
  new = for n <- grades, do: n + 5
  IO.inspect(new)
  new = new ++ [125]
  IO.inspect(new)
  final = [5 | new] #beginning of the list
  IO.inspect(final)

  even = for n <- final, rem(n, 2) == 0, do: n

  #functional programming
  numbers = [1, 2, 3, 4, 5]
  Enum.each(numbers, fn num -> IO.puts(num) end)
  result = Enum.map(numbers, &String.to_integer/1)#catcher operator, pass functions with &
  IO.inspect(result)

  IO.inspect(sum_and_average(result))
  print_numbers(result)
  end
end
