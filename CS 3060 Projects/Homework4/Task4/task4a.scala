def foo(s: String): Boolean = {
  def isPalindromeHelper(left: Int, right: Int): Boolean = {
    if (left >= right) true
    else if (s(left) != s(right)) false
    else isPalindromeHelper(left + 1, right - 1)
  }

  isPalindromeHelper(0, s.length - 1)
}

// Example usage:
val palindrome = "racecar"
val notPalindrome = "hello"

println(foo(palindrome)) // Output: true
println(foo(notPalindrome)) // Output: false
