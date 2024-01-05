import scala.util.Random

abstract class Shape(val color: String) {
  def area: Double
}

class Circle(color: String, val radius: Double) extends Shape(color) {
  override def area: Double = Math.PI * Math.pow(radius, 2)
}

class Hexagon(color: String, val sideLength: Double) extends Shape(color) {
  override def area: Double = 3 * Math.sqrt(3) * Math.pow(sideLength, 2) / 2
}

object Main {
  def main(args: Array[String]): Unit = {
    val shapes = generateRandomShapes()
    val totalArea = calculateTotalArea(shapes)
    println(s"Total area of all shapes: $totalArea")
  }

  def generateRandomShapes(): List[Shape] = {
    val rand = new Random

    (1 to 25).map { _ =>
      val color = "RandomColor" // You can set a specific color or generate one randomly
      if (rand.nextInt(2) == 0) {
        val radius = rand.nextDouble() * 10 // Random radius between 0 and 10
        new Circle(color, radius)
      } else {
        val sideLength = rand.nextDouble() * 10 // Random side length between 0 and 10
        new Hexagon(color, sideLength)
      }
    }.toList
  }

  def calculateTotalArea(shapes: List[Shape]): Double = {
    shapes.map(_.area).sum
  }
}
