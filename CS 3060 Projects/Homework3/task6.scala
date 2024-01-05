object KaprekarNumber {

  /**
   * Function to check if a number is a Kaprekar number
   *
   * @param num The number to be checked
   * @return True if it's a Kaprekar number, otherwise false
   */
  def isKaprekar(num: Int): Boolean = {
    val squared = num.toLong * num
    // Convert the square to a string for manipulation
    val numStr = squared.toString
    
    val numLen = numStr.length

    for (i <- 1 until numLen) {
      val (left, right) = numStr.splitAt(i)
      val leftPart = if (left.nonEmpty) left.toLong else 0
      val rightPart = right.toLong

      if (rightPart != 0 && leftPart + rightPart == num)
        return true
    }

    false
  }

  def main(args: Array[String]): Unit = {
    println("Enter a number to check if it's a Kaprekar number:")
    val numToCheck = scala.io.StdIn.readInt()
    val result = if (isKaprekar(numToCheck)) "is" else "is not"
    println(s"$numToCheck $result a Kaprekar number.")
  }
}
