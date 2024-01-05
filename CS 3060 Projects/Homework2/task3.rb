def process_array(arr)
  # (a) Uses each method to print the last digit of each integer in A
  puts "Last digits of each integer in A:"
  arr.each do |num|
    last_digit = num.abs % 10
    puts last_digit
  end

  # (b) Uses select method to find all the integers whose lengths are less than 4
  less_than_4 = arr.select { |num| num.abs.to_s.length < 4 }
  puts "\nIntegers in A with length less than 4: #{less_than_4}"

  # (c) Uses map method to build a new array with the length of the integers of A
  lengths = arr.map { |num| num.abs.to_s.length }
  puts "\nArray with lengths of integers in A: #{lengths}"

  # (d) Uses inject method to find the sum of the length of all integers of A
  total_length = lengths.inject(0) { |sum, length| sum + length }
  puts "\nSum of lengths of integers in A: #{total_length}"
end

A = [123, 4567, 89, 12345, 678, 90, 1234, 56789, 12, 3456, 7890, 123456]
process_array(A)
