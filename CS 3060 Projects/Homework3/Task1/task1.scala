import scala.io.StdIn
import java.io.PrintWriter

object Task1 {
  def main(args: Array[String]): Unit = {
    // Step 1: Ask user for input and save it to a file
    println("Please type 4 lines:")
    val lines = (1 to 4).map(_ => StdIn.readLine())

    val writer = new PrintWriter("fileTask1.txt")
    lines.foreach(writer.println)
    writer.close()

    // Step 2: Read the file and count words and vowels
    val source = scala.io.Source.fromFile("fileTask1.txt")
    val content = source.mkString
    source.close()

    val wordCount = content.split("\\s+").length
    val vowelCount = content.toLowerCase.count(c => "aeiou".contains(c))

    // Step 3: Report the results
    println(s"Number of words: $wordCount")
    println(s"Total number of vowels: $vowelCount")
  }
}
