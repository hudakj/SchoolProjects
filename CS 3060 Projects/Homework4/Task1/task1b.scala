def foo(s: String): Int = s.toSet.size

def bar(b: List[String]): List[Int] = b.map(foo)

val inputList = List("xycaabcdb", "cczze", "yxzwx")
val result = bar(inputList)
println(s"Result: $result")

