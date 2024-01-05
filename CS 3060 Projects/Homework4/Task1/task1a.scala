object Main {
  def main(args: Array[String]): Unit = {
    println("Enter a string:")
    val userInput = scala.io.StdIn.readLine()
    val result = foo(userInput)
    println(s"Number of unique characters: $result")
  }

  def foo(s: String): Int = s.toSet.size
}

