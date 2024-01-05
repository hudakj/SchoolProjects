import scala.io.Source
import java.net.URL

object WebpageAnalyzer {
  def main(args: Array[String]): Unit = {
    println("Enter the webpage URL:")
    val url = scala.io.StdIn.readLine()

    val startTimeSerial = System.currentTimeMillis()
    val (imageCountX, imageCountYSerial) = countImagesXAndYSerial(url)
    val endTimeSerial = System.currentTimeMillis()

    val startTimeParallel = System.currentTimeMillis()
    val imageCountYParallel = countImagesXAndYParallel(url)
    val endTimeParallel = System.currentTimeMillis()

    println(s"Number of images on webpage x (Serial): $imageCountX")
    println(s"Number of images on linked webpages (Serial): $imageCountYSerial")
    println(s"Execution time (Serial): ${endTimeSerial - startTimeSerial} milliseconds")

    println(s"Number of images on linked webpages (Parallel): $imageCountYParallel")
    println(s"Execution time (Parallel): ${endTimeParallel - startTimeParallel} milliseconds")
  }

  def downloadWebpage(url: String): String = {
    try {
      val source = Source.fromURL(new URL(url))
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

  def findLinkedWebpages(content: String): List[String] = {
    val linkPattern = """<a\s+(?:[^>]*?\s+)?href="([^"]*)"""".r
    linkPattern.findAllMatchIn(content).map(_.group(1)).toList
  }

  def countImagesXAndYSerial(url: String): (Int, Int) = {
    val contentX = downloadWebpage(url)
    val imageCountX = countImages(contentX)
    val linkedWebpages = findLinkedWebpages(contentX)
    val imageCountYSerial = linkedWebpages.map(link => countImages(downloadWebpage(link))).sum
    (imageCountX, imageCountYSerial)
  }

  def countImagesXAndYParallel(url: String): Int = {
    val contentX = downloadWebpage(url)
    val imageCountX = countImages(contentX)
    val linkedWebpages = findLinkedWebpages(contentX)
    val imageCountYParallel = linkedWebpages.par.map(link => countImages(downloadWebpage(link))).sum
    imageCountX + imageCountYParallel
  }
}

