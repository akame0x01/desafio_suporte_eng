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
    how_to_use()
    get_input_from_user()
  end

  def how_to_use do
    IO.puts("explaining...")
  end

  def get_input_from_user do
    # Get User inputs until blank line and check for error.
    #
    check_for_same_name()
  end

  def check_for_same_name do
    # If we have the same name in the list provided by the user, put an romane number in the final. 
    print_list_to_user()
  end

  def print_list_to_user do
    # Print the formated list 
  end
end

KingdomTool.start()
