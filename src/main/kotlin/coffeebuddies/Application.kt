package coffeebuddies

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody

@SpringBootApplication
class Application

fun main(args: Array<String>) {
    runApplication<Application>(*args)
}

@Controller
class CoffeeBuddyController {

    @ResponseBody
    @PostMapping("/pick")
    fun handlePick(
        @RequestBody buddies: Set<Buddy>,
        @RequestParam(required = false) groups: Set<String>?
    ): Set<Buddy> {
        if (groups != null) {
            return pickOnePerGroup(buddies, groups)
        }
        return pickTwo(buddies)
    }

}
