import Foundation

struct Buddy : Hashable {
    var name: String
    var groups: Set<String>
}

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
