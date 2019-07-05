package coffeebuddies

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class CoffeeBuddiesApplication

fun main(args: Array<String>) {
	runApplication<CoffeeBuddiesApplication>(*args)
}
