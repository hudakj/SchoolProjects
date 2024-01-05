import scala.io.Source
import scala.util.Try

object WebpageAnalyzer {
  def main(args: Array[String]): Unit = {
    // Prompt the user for a URL
    println("Enter the webpage URL:")
    val url = scala.io.StdIn.readLine()

    // Download the webpage content
    val content = downloadWebpage(url)

    // Count images and scripts
    val imageCount = countOccurrences(content, "<img")
    val scriptCount = countOccurrences(content, "<script")

    // Print the results
    println(s"Number of images: $imageCount")
    println(s"Number of scripts: $scriptCount")
  }

  def downloadWebpage(url: String): String = {
    Try(Source.fromURL(url).mkString).getOrElse("")
  }

  def countOccurrences(content: String, pattern: String): Int = {
    pattern.r.findAllIn(content).length
  }
}
