#foo function definition
def foo(word)
  char_count = Hash.new(0)

  word.each_char do |char|
    char_count[char] += 1
  end

  char_count
end
#function that puts the output into the readme.txt file
def write_char_count_to_file(file_name, word, char_count)
  File.open(file_name, 'w') do |file|
    file.puts "Character counts for '#{word}':"
    char_count.each do |char, count|
      file.puts "#{char} => #{count}"
    end
  end
end
#made a main function just so the whole program runs with one call.
def main
  print "Enter an English word: "
  word = gets.chomp

  result = foo(word)

  # Write the character counts to a file called "readme.txt"
  write_char_count_to_file("readme.txt", word, result)

  puts "Character counts for '#{word}' have been written to readme.txt."
end

# Invoke the main function
main


