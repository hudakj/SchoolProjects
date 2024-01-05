import scala.io.Source

object StoryStatistics {

  def getWordFrequency(text: String): Map[String, Int] = {
    val words = text.split("\\W+").map(_.toLowerCase)
    words.groupBy(identity).mapValues(_.length).toMap
  }
  
  def getStatistics(text: String): (Int, Int, String, Int) = {
    val wordFrequency = getWordFrequency(text)
    val totalWords = wordFrequency.values.sum
    val uniqueWords = wordFrequency.size
    val sortedWords = wordFrequency.toList.sortBy(-_._2)
    val thirdMostFrequent = if (sortedWords.length >= 3) sortedWords(2) else ("N/A", 0)
    (totalWords, uniqueWords, thirdMostFrequent._1, thirdMostFrequent._2)
  }

  def main(args: Array[String]): Unit = {
    // Read files
    val storyP = Source.fromFile("StoryP.txt").mkString
    val storyQ = Source.fromFile("StoryQ.txt").mkString

    // Get statistics for each story
    val (totalWordsP, uniqueWordsP, thirdMostFrequentP, freqThirdP) = getStatistics(storyP)
    val (totalWordsQ, uniqueWordsQ, thirdMostFrequentQ, freqThirdQ) = getStatistics(storyQ)

    // Get unique words in both stories
    val wordsSetP = getWordFrequency(storyP).keySet
    val wordsSetQ = getWordFrequency(storyQ).keySet
    val commonWords = wordsSetP.intersect(wordsSetQ).size

    // Print the statistics
    println("Statistics for StoryP:")
    println(s"Total Words: $totalWordsP")
    println(s"Unique Words: $uniqueWordsP")
    println(s"Third Most Frequent Word: $thirdMostFrequentP (Frequency: $freqThirdP)")
    println()

    println("Statistics for StoryQ:")
    println(s"Total Words: $totalWordsQ")
    println(s"Unique Words: $uniqueWordsQ")
    println(s"Third Most Frequent Word: $thirdMostFrequentQ (Frequency: $freqThirdQ)")
    println()

    println(s"Number of Unique Words in Both Stories: $commonWords")
  }
}
