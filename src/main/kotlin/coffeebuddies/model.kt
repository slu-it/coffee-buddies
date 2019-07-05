package coffeebuddies

data class Buddy(
    val name: String,
    val groups: Set<Group>
)

enum class Group {
    INTERN, EXTERN, TABLE_ONE, TABLE_TWO
}
