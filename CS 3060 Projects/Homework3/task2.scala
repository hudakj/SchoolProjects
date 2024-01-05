import scala.io.Source
import java.io.File

object FileContentAnalyzer {
  def main(args: Array[String]): Unit = {
    println("Enter the name of the file: ")
    val fileName = scala.io.StdIn.readLine()

    val file = new File(fileName)

    if (file.exists()) {
      val content = Source.fromFile(file).mkString

      if (content.contains("cpp") || content.contains("scala")) {
        println("The file content is important")
      } else if (content.contains("haskell") || content.contains("ruby")) {
        println("The file is interesting")
      } else {
        println("The file is nothing")
      }
    } else {
      println(s"Error: File $fileName not found")
    }
  }
}
