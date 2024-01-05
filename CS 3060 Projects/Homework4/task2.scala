def foo(b1: List[Int]): List[Int] = b1 match {
  case a :: b :: tail => b :: a :: foo(tail)
  case a :: Nil       => List(a)
  case Nil            => Nil
}
val b1 = List(3, 4, 15, 16, 17, 18)
val b2 = foo(b1)

println(s"b1: $b1")
println(s"b2: $b2")
