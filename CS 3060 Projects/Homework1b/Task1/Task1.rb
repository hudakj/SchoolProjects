# Open the file in write mode to save user input
File.open("myFile.txt", "w") do |file|
  line_number = 1

  # Ask the user for 4 lines of input
  4.times do
    puts "Enter line ##{line_number}:"
    line = gets.chomp

    # Write the input to the file with line number
    file.puts "L#{line_number}: #{line}"

    line_number += 1
  end
end

# Open the file in read mode to process and count words
File.open("myFile.txt", "r") do |file|
  line_number = 1

  # Process each line in the file
  file.each_line do |line|
    words = line.split
    word_count = words.size - 1

    # Output the word count for each line
    puts "L#{line_number}: #{word_count}"

    line_number += 1
  end
end




