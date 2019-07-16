import Foundation

extension Array where Element == Buddy {
    
    func pick(amount: Int) -> Array<Buddy> {
        let shuffled = onlyPresenet().shuffled()
        return Array(shuffled.prefix(amount))
    }
    
    func pick(groups: Set<String>) -> Dictionary<String, Buddy?> {
        var buddiesByGroup = Dictionary<String, Array<Buddy>>()
        for group in groups { buddiesByGroup[group] = Array<Buddy>() }
        
        for buddy in onlyPresenet() {
            for group in buddy.groups {
                buddiesByGroup[group]?.append(buddy)
            }
        }
        
        return buddiesByGroup.mapValues { buddies in buddies.randomElement() }
    }
    
    private func onlyPresenet() -> Array<Buddy> {
        return filter { buddy in buddy.present }
    }
    
}
