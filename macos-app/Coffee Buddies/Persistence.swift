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
    Buddy(name: "Matthias", image: "matthias_1", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Barbara", image: "barbara_1", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Dennis", image: "dennis_2", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Stephan B.", image: "stephan_b_1", groups: [TABLE_ONE, EXTERN]),
    Buddy(name: "Anja", image: "anja_1", groups: [TABLE_ONE, EXTERN]),
    Buddy(name: "Marco", image: "marco_1", groups: [TABLE_ONE, EXTERN]),
    Buddy(name: "Christian", image: "christian_2", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Stefan L.", image: "stefan_l_1", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Stefan G.", image: "stefan_g_1", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Alexander", image: "alexander_1", groups: [TABLE_TWO, INTERN]),
    Buddy(name: "Florian", image: "florian_1", groups: [TABLE_TWO, INTERN]),
    Buddy(name: "Nadine", image: "nadine_1", groups: [TABLE_ONE, EXTERN]),
    Buddy(name: "Berthold", image: "berthold_1", groups: [TABLE_TWO, INTERN])
)

func addBuddy(_ buddy: Buddy) {
    
}

func getBuddyList() -> Array<Buddy> {
    return buddies
}
