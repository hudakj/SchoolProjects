# Function4A: Iterative Fibonacci Series
def fibonacci_iterative(n)
  fib = [0, 1]

  (2..n).each do |i|
    fib[i] = fib[i-1] + fib[i-2]
  end

  return fib[n]
end

# Function4B: Recursive Fibonacci Series
def fibonacci_recursive(n)
  return n if (0..1).include? n
  return fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
end

# Benchmarking the computation time
require 'benchmark'

n = 38

iterative_time = Benchmark.realtime { fibonacci_iterative(n) }
recursive_time = Benchmark.realtime { fibonacci_recursive(n) }

puts "Iterative Fibonacci for n = #{n}: #{fibonacci_iterative(n)}"
puts "Iterative Time: #{iterative_time} seconds"

puts "\nRecursive Fibonacci for n = #{n}: #{fibonacci_recursive(n)}"
puts "Recursive Time: #{recursive_time} seconds"