import scala.io.Source
import java.net.URL

object WebpageAnalyzer {
  def main(args: Array[String]): Unit = {
    // Prompt the user for a URL
    println("Enter the webpage URL:")
    val url = scala.io.StdIn.readLine()

    // Download the content of the initial webpage (x)
    val contentX = downloadWebpage(url)

    // Count images on the initial webpage (x)
    val imageCountX = countImages(contentX)

    // Find links in the initial webpage (y)
    val linkedWebpages = findLinkedWebpages(contentX)

    // Count images on linked webpages (y)
    val imageCountsY = linkedWebpages.map(url => countImages(downloadWebpage(url)))

    // Calculate total image count
    val totalImageCount = imageCountsY.sum + imageCountX

    // Print the results
    println(s"Number of images on webpage x: $imageCountX")
    println(s"Number of images on linked webpages (y): ${imageCountsY.mkString(", ")}")
    println(s"Total number of images: $totalImageCount")
  }

  // Function to download webpage content
 def downloadWebpage(url: String): String = {
  val fullUrl = if (url.startsWith("http")) url else s"https://$url"
  try {
    val source = Source.fromURL(new URL(fullUrl))
    val content = source.mkString
    source.close()
    content
  } catch {
    case e: Exception => 0
  }
}

  // Function to count images in webpage content
  def countImages(content: String): Int = {
    val imgPattern = """<img[^>]*>""".r
    imgPattern.findAllIn(content).length
  }

  // Function to find linked webpages
  def findLinkedWebpages(content: String): List[String] = {
    val linkPattern = """<a\s+(?:[^>]*?\s+)?href="([^"]*)"""".r
    linkPattern.findAllMatchIn(content).map(_.group(1)).toList
  }
}

