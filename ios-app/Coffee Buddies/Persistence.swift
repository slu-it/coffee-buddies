import Foundation

private let TABLE_ONE = "TABLE_ONE"
private let TABLE_TWO = "TABLE_TWO"
private let INTERN = "INTERN"
private let EXTERN = "EXTERN"

private var groupCategories = Array(arrayLiteral:
    GroupCategory(
        id: "TABLES",
        label: "Tables",
        group1: Group(id: TABLE_ONE, label: "First Table"),
        group2: Group(id: TABLE_TWO, label: "Second Table")
    ),
    GroupCategory(
        id: "INTERN_EXTERN",
        label: "Intern + Extern",
        group1: Group(id: INTERN, label: "Intern"),
        group2: Group(id: EXTERN, label: "Extern")
    )
)


func addGroupCategory(_ groupCategory: GroupCategory) {
    
}

func updateGroupCategory(_ groupCategory: GroupCategory) {
    
}

func deleteGroupCategoryById(_ id: String) {
    
}

func getGroupCategories() -> Array<GroupCategory> {
    return groupCategories
}

private let buddies = Array(arrayLiteral:
    Buddy(name: "Alexander", groups: [TABLE_TWO, INTERN]),
    Buddy(name: "Anja", groups: [TABLE_ONE, EXTERN]),
    Buddy(name: "Barbara", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Christian", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Dennis", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Florian", groups: [TABLE_TWO, INTERN]),
    Buddy(name: "Marco", groups: [TABLE_ONE, EXTERN]),
    // Buddy(name: "Mareike", groups: [TABLE_TWO, INTERN]),
    Buddy(name: "Matthias", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Nadine", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Stefan G.", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Stefan L.", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Stephan B.", groups: [TABLE_ONE, EXTERN])
)

func addBuddy(_ buddy: Buddy) {
    
}

func getBuddyList() -> Array<Buddy> {
    return buddies
}
