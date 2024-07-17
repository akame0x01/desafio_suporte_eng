defmodule KingdomTool do
  @mappings [{"X", 10}, {"IX", 9}, {"V", 5}, {"IV", 4}, {"I", 1}]

  def convert(number) when number > 1 do
    {0, str} =
      Enum.reduce(@mappings, {number, ""}, fn {roman, arabic}, {number, str} ->
        {rem(number, arabic), str <> String.duplicate(roman, div(number, arabic))}
      end)

    str
  end

  def convert(number) do 
      ""
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
    names_uniq = Enum.uniq(names_list)

    formated_list = []
    formated_list = Enum.reduce(names_uniq, formated_list, fn element,acc ->
      n_name = Map.get(names_map,element)
      formated_name = element <> " " <> KingdomTool.convert(n_name)
      [formated_name | acc]
    end) |> Enum.reverse()

    IO.inspect(formated_list, label: "formated_list", charlists: :as_lists)
    formated_list
  end

  def print_list_to_user(names_list_formated) do
    Enum.join(names_list_formated,"\n") |> IO.puts()
  end
end
KingdomTool.start()
