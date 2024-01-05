def foo(list1: List[Int], list2: List[Int], list3: List[Int]): List[(Int, Int, Int)] = {
  val maxLength = List(list1.length, list2.length, list3.length).min
  (list1.take(maxLength), list2.take(maxLength), list3.take(maxLength)).zipped.toList
}
val result1 = foo(List(1,2,3), List(21,22,23), List(11,12,13))
val result2 = foo(List(1,2,3), List(21,23), List(11,12,13))
val result3 = foo(List(1,2), List(21,22,23), List(11,12,13))

println(result1) // Output: List((1,21,11), (2,22,12), (3,23,13))
println(result2) // Output: List((1,21,11), (2,23,12))
println(result3) // Output: List((1,21,11), (2,22,12))
