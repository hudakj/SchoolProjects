object Main extends App {
  def foo(s: String): Boolean = {
    def isPalindromeHelper(left: Int, right: Int): Boolean = {
      if (left >= right) true
      else if (s(left) != s(right)) false
      else isPalindromeHelper(left + 1, right - 1)
    }

    isPalindromeHelper(0, s.length - 1)
  }

  def bar(b: List[String]): List[String] = {
    b.filter(foo)
  }

  // Example usage:
  val inputList = List("malayalam", "cczze", "yxzxy")

  val result = bar(inputList)
  println(result) // Output: List(malayalam, yxzxy)
}

