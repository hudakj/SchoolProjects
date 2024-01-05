import scala.io.Source

object WebpageAnalyzer {
  def main(args: Array[String]): Unit = {
    println("Enter the webpage URL:")
    val url = scala.io.StdIn.readLine()

    val contentX = downloadWebpage(url)
    val (imageCountX, longPageCountX) = countImagesAndLongPages(contentX)

    println(s"Number of images on webpage x: $imageCountX")
    println(s"Number of webpages with more than 50 characters on webpage x: $longPageCountX")
  }

  def downloadWebpage(url: String): String = {
    try {
      val source = Source.fromURL(new java.net.URL(url), "UTF-8")
      val content = source.mkString
      source.close()
      content
    } catch {
      case e: Exception =>
        println(s"Error downloading webpage from $url: ${e.getMessage}")
        ""
    }
  }

  def countImages(content: String): Int = {
    val imgPattern = """<img[^>]*>""".r
    imgPattern.findAllIn(content).length
  }

  def countLongPages(content: String): Int = {
    val pages = content.split("<a")
    pages.count(_.length > 50)
  }

  def countImagesAndLongPages(content: String): (Int, Int) = {
    val imgCount = countImages(content)
    val longPageCount = countLongPages(content)
    (imgCount, longPageCount)
  }

  def findLinkedWebpages(content: String): List[String] = {
    val linkPattern = """<a\s+(?:[^>]*?\s+)?href="([^"]*)"""".r
    linkPattern.findAllMatchIn(content).map(_.group(1)).toList
  }
}

