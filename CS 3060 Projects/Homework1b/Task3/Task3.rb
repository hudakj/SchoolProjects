def simulate_coin_toss(num_tosses)
  coin_outcomes = []
  head_count = 0
  tail_count = 0

  num_tosses.times do
    coin = rand(2) == 0 ? 'HEAD' : 'TAIL'
    coin_outcomes << coin

    if coin == 'HEAD'
      head_count += 1
    else
      tail_count += 1
    end
  end

  [coin_outcomes, head_count, tail_count]
end

def write_coin_toss_results_to_file(file_name, num_tosses, coin_outcomes, head_count, tail_count, head_tail_ratio)
  File.open(file_name, 'w') do |file|
    file.puts "Coin Toss Results for #{num_tosses} Tosses:"
    file.puts coin_outcomes.join(', ')

    file.puts "\nNumber of Heads: #{head_count}"
    file.puts "Number of Tails: #{tail_count}"
    file.puts "Head to Tail Ratio: #{head_tail_ratio}"
  end
end

def main
  print "Enter a number between 50 and 100: "
  num_tosses = gets.chomp.to_i

  if num_tosses < 50 || num_tosses > 100
    puts "Please enter a valid number between 50 and 100."
    return
  end

  coin_outcomes, head_count, tail_count = simulate_coin_toss(num_tosses)
  head_tail_ratio = head_count.to_f / tail_count

  # Write the coin toss results to a file called "readmeTask3.txt"
  write_coin_toss_results_to_file("readmeTask3.txt", num_tosses, coin_outcomes, head_count, tail_count, head_tail_ratio)

  puts "Coin Toss Results have been written to readmeTask3.txt."
end

# Invoke the main function
main
