object Task3 {
  def main(args: Array[String]): Unit = {
    // Loop through numbers from 25 to 34
    for (x <- 25 to 34) {
      val y = math.sqrt(x)
      println(s"The square root of $x is $y")
    }
  }
}
