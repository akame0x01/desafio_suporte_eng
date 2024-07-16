defmodule Math do 
  def sum(a,b) do 
    do_sum(a,b)
  end

  defp do_sum(a,b) do
    a+b 
  end

  def is_zero?(0) do 
    true 
  end 

  def is_zero?(x) when is_integer(x) do
    false
  end
end


IO.puts Math.sum(2,2) #=> 4
IO.puts( Math.is_zero?(1))
IO.puts( Math.is_zero?(0))
IO.puts( Math.is_zero?([1,2,3]))
# IO.puts Math.do_sum(1,2) #=> Undefined cause its private

