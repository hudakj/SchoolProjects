def contains_pattern(word)
  first_char = word[0]
  last_char = word[-1]
  vowels = 'aeiouAEIOU' #values we are looking for
  
  # Check if the first character is an uppercase letter,
  # the last character is a lowercase letter, and the word contains     at least one vowel.
  
  if first_char =~ /[A-Z]/ && last_char =~ /[a-z]/ && (word.chars & vowels.chars).any?
    return true
  else
    return false
  end
end
#gets file and finds lines that meet criteria for pattern
def process_file(filename)
  matching_lines = [] 
    #iterate through each line in file
  File.foreach(filename).with_index do |line, line_number|
    words = line.split
    matching_words = words.select { |word| contains_pattern(word) }
    #checks if there is at least two matching words
    if matching_words.length >= 2
      matching_lines << "Line #{line_number + 1}: #{line.chomp}"
    end
  end

  matching_lines
end

filename = ARGV[0] #gets file name from command line

unless File.file?(filename)
  puts "Error: #{filename} does not exist."
  exit 1
end

matching_lines = process_file(filename)

if matching_lines.empty?
  puts "No lines in #{filename} match the required pattern."
else
  puts matching_lines
  puts "This file has #{matching_lines.length} lines which satisfy the required pattern."
end

