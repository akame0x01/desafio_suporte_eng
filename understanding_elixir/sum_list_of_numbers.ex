defmodule Math do 
  def sum_list([head | tail], accumulator) do
    IO.puts("tail: #{tail}")
    IO.puts("head: #{head}")
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do 
    accumulator
  end
end

IO.puts Math.sum_list([1, 2, 3], 0 ) #=> 


# sum_list [1, 2, 3, 4, 5], 0 => match the first def, head will be 1 and tail [2,3]
# sum_list [2, 3], 1 => add head to accumulator and call it again, the tail will once again match the first def until the list is empty
# sum_list [3], 3
# sum_list [], 6

