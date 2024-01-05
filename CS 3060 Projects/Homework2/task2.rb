def foo(x)
  result = 1
  x.times do
    result *= x
  end
  return result
end
x_values = [5, 6, 7]

x_values.each do |x|
  result = foo(x)
  puts "#{x}^#{x} = #{result}"
end