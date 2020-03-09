import Foundation

protocol Method {
    func getLabel() -> String
    func pickFrom(_ buddyList: Array<Buddy>) -> (Buddy?, Buddy?)
}

class RandomMethod: Method {
    
    func getLabel() -> String {
        return "Random"
    }
    
    func pickFrom(_ buddyList: Array<Buddy>) -> (Buddy?, Buddy?) {
        let pickedBuddies = buddyList.pick(amount: 2)
        switch pickedBuddies.count {
            case 2: return (pickedBuddies[0], pickedBuddies[1])
            case 1: return (pickedBuddies[0], nil)
            default: return (nil, nil)
        }
    }
    
}

class GroupBasedMethod: Method {
    
    private let groupCategory: GroupCategory
    
    init(_ groupCategory: GroupCategory) {
        self.groupCategory = groupCategory
    }
    
    func getLabel() -> String {
        return groupCategory.label
    }
    
    func pickFrom(_ buddyList: Array<Buddy>) -> (Buddy?, Buddy?) {
        let groupId1 = groupCategory.group1.id
        let groupId2 = groupCategory.group2.id
        let pickedBuddies = buddyList.pick(groups: Set(arrayLiteral: groupId1, groupId2))
        return (pickedBuddies[groupId1] ?? nil, pickedBuddies[groupId2] ?? nil)
    }
    
}
