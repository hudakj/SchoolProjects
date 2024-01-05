object SumOfPower {
  def main(args: Array[String]): Unit = {
    // Prompt user for input
    println("Enter a positive integer (n): ")
    val n = scala.io.StdIn.readInt()

    // Calculate and print the sum of powers
    val result = calculateSumOfPower(n)
    println(s"The sum of powers from 1 to $n is: $result")
  }

  def calculateSumOfPower(n: Int): Long = {
    var sum = 0L
    for (i <- 1 to n) {
      var term = 1L
      for (j <- 1 to i) {
        term *= i
      }
      sum += term
    }
    sum
  }
}
