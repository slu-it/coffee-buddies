import Foundation

class Buddy {
    
    let name: String
    let groups: Set<String>
    var present: Bool
    var pickedTimes: Int
    
    init(name: String, groups: Set<String>) {
        self.name = name
        self.groups = groups
        self.present = true
        self.pickedTimes = 0
    }
    
    func switchPresent() {
        present = !present
    }
    
    func incrementPickedTimes() {
        pickedTimes += 1
    }
    
}
