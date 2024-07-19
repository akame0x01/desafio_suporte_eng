defmodule KingdomTool do
  @mappings [{"X", 10}, {"IX", 9}, {"V", 5}, {"IV", 4}, {"I", 1}]

  def convert(number) when number >= 1 do
    {0, str} =
      Enum.reduce(@mappings, {number, ""}, fn {roman, arabic}, {number, str} ->
        {rem(number, arabic), str <> String.duplicate(roman, div(number, arabic))}
      end)

    str
  end

  def start do
    names_list = []
    KingdomTool.how_to_use()
    KingdomTool.get_inputs(names_list) 
    |> KingdomTool.format_to_roman() 
    |> KingdomTool.print_list_to_user()
  end

  def how_to_use do
    IO.puts("explaining......\n")
  end

  def get_inputs(list) do
    name_input = IO.gets("> ")
      |> String.capitalize()
      |> String.trim() 
      |> String.replace(~r/\d/,"")

  
    if name_input == "" do
      Enum.reverse(list)
    else
      list = [name_input | list]
      KingdomTool.get_inputs(list)
    end
  end

  def format_to_roman(names_list) do
    names_map = Enum.frequencies(names_list)
    {count, result} = {names_map, []}
    starting_0 = Enum.into(Enum.map(names_map, fn ({key, _value}) -> {key, 1} end), %{})

    {_count, result, starting_0} = Enum.reduce(names_list, {count,result, starting_0}, fn (element,{record_times,acc, starting_0}) ->
      number_of_reps = Map.get(names_map,element)
      # name is repeated.
      if (number_of_reps > 1) do
          number_of_reps = Map.get(starting_0,element)
          formated_name = element <> " " <> KingdomTool.convert(number_of_reps)

          starting_0 = Map.replace(starting_0,element,number_of_reps + 1)
          {record_times, [formated_name | acc], starting_0}
      else
          {record_times, [ element  | acc], starting_0} 
      end

    end)

    formated_list = Enum.reverse(result)

    formated_list
  end

  def print_list_to_user(names_list_formated) do
    Enum.join(names_list_formated,"\n") |> IO.puts()
  end

end


KingdomTool.start()
