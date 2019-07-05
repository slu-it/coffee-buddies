package coffeebuddies


fun pickTwo(buddies: Set<Buddy>): Set<Buddy> {
    require(buddies.size >= 2)
    return buddies.shuffled().take(2).toSet()
}

fun pickOnePerGroup(buddies: Set<Buddy>, groups: Set<String>): Set<Buddy> {
    val groupToBuddies = mapToGroup(buddies)
    return groups.asSequence()
        .map { group -> groupToBuddies.getValue(group) }
        .map { buddiesOfGroup -> pickRandom(buddiesOfGroup) }
        .toSet()
}

private fun mapToGroup(buddies: Set<Buddy>): Map<String, Set<Buddy>> {
    val groupToBuddies = mutableMapOf<String, MutableSet<Buddy>>()
    buddies.forEach { buddy ->
        buddy.groups.forEach { group ->
            groupToBuddies.computeIfAbsent(group) { HashSet() }.add(buddy)
        }
    }
    return groupToBuddies
}

private fun pickRandom(buddies: Collection<Buddy>): Buddy {
    require(buddies.isNotEmpty())
    return buddies.shuffled().first()
}
