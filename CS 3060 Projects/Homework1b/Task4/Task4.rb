# Function to read a text file and return an array of words
def read_file(file_name)
  File.read(file_name).split
end

# Function to calculate statistics for an array of words
def calculate_statistics(words)
  # Total number of words
  total_words = words.length

  # Number of unique words
  num_unique_words = words.uniq.length

  # Create a hash to store word frequencies
  word_freq = Hash.new(0)
  words.each { |word| word_freq[word] += 1 }

  # Sort the hash by word frequency
  sorted_word_freq = word_freq.sort_by { |_word, freq| freq }.reverse

  # 3rd most frequent word and its frequency
  if sorted_word_freq.length >= 3
    third_most_freq_word, third_most_freq_count = sorted_word_freq[2]
  else
    third_most_freq_word, third_most_freq_count = nil, 0
  end

  [total_words, num_unique_words, third_most_freq_word, third_most_freq_count]
end

# Function to write statistics to a file
def write_statistics_to_file(file_name, stats)
  File.open(file_name, 'w') do |file|
    file.puts "Statistics for #{file_name}:"
    file.puts "Total words: #{stats[0]}"
    file.puts "Number of unique words: #{stats[1]}"
    file.puts "3rd most frequent word: #{stats[2]}"
    file.puts "Frequency of 3rd most frequent word: #{stats[3]}"
  end
end

# Read and process the first file
fileP_words = read_file("storyP.txt")
fileP_stats = calculate_statistics(fileP_words)

# Read and process the second file
fileQ_words = read_file("storyQ.txt")
fileQ_stats = calculate_statistics(fileQ_words)

# Calculate the number of unique words present in both files
common_words = (fileP_words & fileQ_words).length

# Write the statistics to a file called "readmeTask4.txt"
write_statistics_to_file("readmeTask4.txt", fileP_stats)
write_statistics_to_file("readmeTask4.txt", fileQ_stats)

File.open("readmeTask4.txt", 'a') do |file|
  file.puts "Number of unique words present in both files: #{common_words}"
end

