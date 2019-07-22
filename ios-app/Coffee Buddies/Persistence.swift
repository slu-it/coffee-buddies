import Foundation

struct GroupCategory {
    let id: String
    let label: String
    let group1: Group
    let group2: Group
}

struct Group {
    let id: String
    let label: String
}

private let gcTables = GroupCategory(
    id: "TABLES",
    label: "Tables",
    group1: Group(id: "TABLE_ONE", label: "First Table"),
    group2: Group(id: "TABLE_TWO", label: "Second Table")
)

private let gcInternExtern = GroupCategory(
    id: "INTERN_EXTERN",
    label: "Intern + Extern",
    group1: Group(id: "INTERN", label: "Intern"),
    group2: Group(id: "EXTERN", label: "Extern")
)

func getGroupCategories() -> Array<GroupCategory> {
    return Array(arrayLiteral: gcTables, gcInternExtern)
}
