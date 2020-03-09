import Foundation

class Buddy {
    
    let name: String
    let image: String
    let groups: Set<String>
    var present: Bool
    var pickedCount: Int
    
    init(name: String, image: String, groups: Set<String>) {
        self.name = name
        self.image = image
        self.groups = groups
        self.present = true
        self.pickedCount = 0
    }
    
    func switchPresent() {
        present = !present
    }
    
    func incrementPickedCount() {
        pickedCount += 1
    }
    
}
