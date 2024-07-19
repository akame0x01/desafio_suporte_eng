defmodule KingdomTool do
  @mappings [{"X", 10}, {"IX", 9}, {"V", 5}, {"IV", 4}, {"I", 1}]
 
  def start do
    names_list = []
    KingdomTool.how_to_use()
    KingdomTool.get_inputs(names_list) 
    |> KingdomTool.format_names_to_roman() 
    |> KingdomTool.print_list_to_user()
  end

  def how_to_use do
    IO.puts("Esta ferramenta organiza e numera uma lista de reis e rainhas de Cumbúquia. Ela recebe os nomes em ordem cronológica e os retorna com a devida numeração em algarismos romanos.\n\nPor favor, insira os nomes abaixo, caso nao queira inserir mais nomes, deixe a linha em branco e aperte Enter.\n")
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

  def from_int_to_roman(number) when number >= 1 do
    {0, str} =
      Enum.reduce(@mappings, {number, ""}, fn {roman, arabic}, {number, str} ->
        {rem(number, arabic), str <> String.duplicate(roman, div(number, arabic))}
      end)
    str
  end

  def format_names_to_roman(names_list) do
    names_map = Enum.frequencies(names_list)
    names_map_values_to_one = Enum.into(Enum.map(names_map, fn ({key, _value}) -> {key, 1} end), %{})
    result = []

    {result, _names_map_values_to_one} = Enum.reduce(names_list, {result, names_map_values_to_one}, fn (element,{accumulator_result, map_to_inc_rep}) ->
          number_of_reps = Map.get(map_to_inc_rep,element)
          formated_name = element <> " " <> KingdomTool.from_int_to_roman(number_of_reps)

          map_to_inc_rep = Map.replace(map_to_inc_rep,element,number_of_reps + 1)
          {[formated_name | accumulator_result], map_to_inc_rep}

    end)
    formated_list = Enum.reverse(result)
    formated_list
  end

  def print_list_to_user(names_list_formated) do
    Enum.join(names_list_formated,"\n") |> IO.puts()
  end
end

KingdomTool.start()
