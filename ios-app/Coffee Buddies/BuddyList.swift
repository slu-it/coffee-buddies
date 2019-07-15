import Foundation

let TABLE_ONE = "TABLE_ONE"
let TABLE_TWO = "TABLE_TWO"
let INTERN = "INTERN"
let EXTERN = "EXTERN"

// initial data when app starts
// TODO: put into database
let buddyList = BuddyList(
    buddies: [
        Buddy(name: "Matthias", groups: [TABLE_ONE, INTERN], present: true),
        Buddy(name: "Barbara", groups: [TABLE_ONE, INTERN], present: true),
        Buddy(name: "Dennis", groups: [TABLE_ONE, INTERN], present: true),
        Buddy(name: "Stephan B.", groups: [TABLE_ONE, EXTERN], present: true),
        Buddy(name: "Anja", groups: [TABLE_ONE, EXTERN], present: true),
        Buddy(name: "Marco", groups: [TABLE_ONE, EXTERN], present: true),
        Buddy(name: "Christian", groups: [TABLE_TWO, EXTERN], present: true),
        Buddy(name: "Stefan L.", groups: [TABLE_TWO, EXTERN], present: true),
        Buddy(name: "Stefan G.", groups: [TABLE_TWO, EXTERN], present: true),
        Buddy(name: "Alexander", groups: [TABLE_TWO, INTERN], present: true),
        Buddy(name: "Florian", groups: [TABLE_TWO, INTERN], present: true),
        Buddy(name: "Mareike", groups: [TABLE_TWO, INTERN], present: true)
    ]
)

class BuddyList {
    
    private var randomNumberGenerator = SystemRandomNumberGenerator()
    
    let buddies: Array<Buddy>
    
    init(buddies: Array<Buddy>) {
        self.buddies = buddies
    }
    
    func pick(amount: Int) -> Set<Buddy> {
        let shuffled = buddies.shuffled()
        return Set(shuffled.prefix(amount))
    }
    
    func pick(groups: Set<String>) -> Dictionary<String, Buddy> {
        var buddiesByGroup = Dictionary<String, Set<Buddy>>()
        for group in groups { buddiesByGroup[group] = Set<Buddy>() }
        
        for buddy in buddies {
            for group in buddy.groups {
                buddiesByGroup[group]?.insert(buddy)
            }
        }
        
        return buddiesByGroup.mapValues { buddies in buddies.randomElement()! }
    }
    
}

struct Buddy : Hashable {
    var name: String
    var groups: Set<String>
    var present: Bool
}
