import Foundation

let TABLE_ONE = "TABLE_ONE"
let TABLE_TWO = "TABLE_TWO"
let INTERN = "INTERN"
let EXTERN = "EXTERN"

// initial data when app starts
// TODO: put into database
let globalBuddyList = BuddyList(
    buddies: [
        Buddy(name: "Matthias", groups: [TABLE_ONE, INTERN]),
        Buddy(name: "Barbara", groups: [TABLE_ONE, INTERN]),
        Buddy(name: "Dennis", groups: [TABLE_ONE, INTERN]),
        Buddy(name: "Stephan B.", groups: [TABLE_ONE, EXTERN]),
        Buddy(name: "Anja", groups: [TABLE_ONE, EXTERN]),
        Buddy(name: "Marco", groups: [TABLE_ONE, EXTERN]),
        Buddy(name: "Christian", groups: [TABLE_TWO, EXTERN]),
        Buddy(name: "Stefan L.", groups: [TABLE_TWO, EXTERN]),
        Buddy(name: "Stefan G.", groups: [TABLE_TWO, EXTERN]),
        Buddy(name: "Alexander", groups: [TABLE_TWO, INTERN]),
        Buddy(name: "Florian", groups: [TABLE_TWO, INTERN]),
        Buddy(name: "Mareike", groups: [TABLE_TWO, INTERN])
    ]
)

class BuddyList {
    
    private let buddies: Array<Buddy>
    
    init(buddies: Array<Buddy>) {
        self.buddies = buddies
    }
    
    func count() -> Int {
        return buddies.count
    }
    
    func getBuddyAt(index: Int) -> Buddy {
        return buddies[index]
    }
    
    func pick(amount: Int) -> Array<Buddy> {
        let shuffled = presentBuddies().shuffled()
        return Array(shuffled.prefix(amount))
    }
    
    func pick(groups: Set<String>) -> Dictionary<String, Buddy?> {
        var buddiesByGroup = Dictionary<String, Array<Buddy>>()
        for group in groups { buddiesByGroup[group] = Array<Buddy>() }
        
        for buddy in presentBuddies() {
            for group in buddy.groups {
                buddiesByGroup[group]?.append(buddy)
            }
        }
        
        return buddiesByGroup.mapValues { buddies in buddies.randomElement() }
    }
    
    private func presentBuddies() -> Array<Buddy> {
        return buddies.filter{ buddy in buddy.present }
    }
    
}

class Buddy {
    
    let name: String
    let groups: Set<String>
    var present: Bool
    
    init(name: String, groups: Set<String>) {
        self.name = name
        self.groups = groups
        self.present = true
    }
    
    func switchPresent() {
        present = !present
    }
    
}
