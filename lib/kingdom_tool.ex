#
# ferramenta de linha de comando que você irá desenvolver deve receber a lista dos reis e rainhas de Cumbúquia em ordem e retornar os mesmos nomes, cada um com sua devida numeração.
#
# Ao iniciar o binário, ele deve primeiro exibir uma breve explicação de seu uso. Ele irá então esperar o usuário inserir uma lista de nomes. Os nomes serão inseridos um por linha, e a lista será considerada terminada quando for lida uma linha em branco.
#
# Após a lista ser finalizada, a ferramenta irá repetir os nomes inseridos, porém, os nomes serão acrescidos de um número romano conforme necessário.
#

defmodule KingdomTool do
  @moduledoc """
  Documentation for `KingdomTool`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> KingdomTool.hello()
      :world

  """
  def start do
    KingdomTool.how_to_use()
    names_list = []
    names_list = KingdomTool.get_inputs(names_list)
    IO.inspect(names_list, label: "Names_list", charlists: :as_lists)
    names_list = KingdomTool.check_for_same_name(names_list)
    IO.inspect(names_list, label: "Names_list", charlists: :as_lists)
  end

  def how_to_use do
    IO.puts("explaining...\n")
  end

  def get_inputs(list) do
    # Get User inputs, remove any blank characters and if it's not empty save it to a list.
    input = IO.gets("> ") |> String.trim()
    
    # Names does have numbers, remove any numbers in the input and if there are only numbers the result will be an empty string.
    input = String.replace(input, ~r/\d/,"")

    if input == "" do
      list = Enum.reverse(list)
    else
      list = [input | list]
      KingdomTool.get_inputs(list)
    end
  end

  def check_for_same_name(names_list) do
    # If we have the same name in the list provided by the user, put an romane number in the final. 
    #String.downcase(string) |> String.normalize(:nfkd)
    KingdomTool.print_list_to_user()
  end

  def print_list_to_user do
    # Print the formated list 
  end
end

KingdomTool.start()
