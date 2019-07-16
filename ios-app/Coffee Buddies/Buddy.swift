import Foundation

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
