object StringSegments {
  def main(args: Array[String]): Unit = {
    // Prompt user for input
    println("Enter a string: ")
    val inputString = scala.io.StdIn.readLine()
    
    println("Enter a character to split the string: ")
    val charToSplit = scala.io.StdIn.readChar()

    // Calculate and print the list of segments
    val segments = splitString(inputString, charToSplit)
    println(s"The segments are: $segments")
  }

  def splitString(input: String, char: Char): List[String] = {
    def helper(remaining: List[Char], currentSegment: String, segments: List[String]): List[String] = {
      remaining match {
        case Nil => currentSegment :: segments
        case head :: tail =>
          if (head == char) {
            helper(tail, "", currentSegment :: segments)
          } else {
            helper(tail, currentSegment + head, segments)
          }
      }
    }

    helper(input.toList, "", Nil).reverse
  }
}
