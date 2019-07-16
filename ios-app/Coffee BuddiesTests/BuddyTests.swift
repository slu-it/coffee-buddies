//
//  BuddyTests.swift
//  Coffee BuddiesTests
//
//  Created by Stefan on 13.07.19.
//  Copyright © 2019 Stefan Ludwig. All rights reserved.
//

import XCTest
@testable import Coffee_Buddies

class BuddyTests: XCTestCase {

    let buddyList = BuddyList(
        buddies: [
            Buddy(name: "Matthias", groups: ["TABLE_ONE", "INTERN"]),
            Buddy(name: "Barbara", groups: ["TABLE_ONE", "INTERN"]),
            Buddy(name: "Dennis", groups: ["TABLE_ONE", "INTERN"]),
            Buddy(name: "Stephan B.", groups: ["TABLE_ONE", "EXTERN"]),
            Buddy(name: "Anja", groups: ["TABLE_ONE", "EXTERN"]),
            Buddy(name: "Marco", groups: ["TABLE_ONE", "EXTERN"]),
            Buddy(name: "Christian", groups: ["TABLE_TWO", "EXTERN"]),
            Buddy(name: "Stefan L.", groups: ["TABLE_TWO", "EXTERN"]),
            Buddy(name: "Stefan G.", groups: ["TABLE_TWO", "EXTERN"]),
            Buddy(name: "Alexander", groups: ["TABLE_TWO", "INTERN"]),
            Buddy(name: "Florian", groups: ["TABLE_TWO", "INTERN"]),
            Buddy(name: "Mareike", groups: ["TABLE_TWO", "INTERN"])
        ]
    )
    
    func testPickAmount() {
        repeated(times: 10) {
            print(buddyList.pick(amount: 2).map { $0.name })
        }
    }

    func testPickAmountIsEquallyDistributed() {
        repeated(times: 5) {
            assert(pickAmountAndReturnStandardDeviation(10_000) < 0.005) // less than 0.5 %
        }
    }

    private func pickAmountAndReturnStandardDeviation(_ repetitions: Int) -> Double {
        let amountOfPicks = 2
        
        var buddyToCount = [String:Int]()
        repeated(times: repetitions) {
            let pick = buddyList.pick(amount: amountOfPicks)
            for buddy in pick { buddyToCount[buddy.name] = (buddyToCount[buddy.name] ?? 0) + 1 }
        }
        let buddyToPercentage = buddyToCount.percentages(repetitions * amountOfPicks)
        
        return buddyToPercentage.map { $1 }.std()
    }
    
    func testPickPerGroup() {
        repeated(times: 10) {
            let picks = buddyList.pick(groups: ["INTERN", "EXTERN"])
                .map { group, buddy in "\(group): \(buddy!.name)" }
            print(picks)
        }
    }
    
    func testPickPerGroupIsEquallyDistributed() {
        repeated(times: 5) {
            assert(pickGroupAndReturnStandardDeviation(10_000) < 0.005) // less than 0.5 %
        }
    }
    
    private func pickGroupAndReturnStandardDeviation(_ repetitions: Int) -> Double {
        let groups: Set<String> = ["INTERN", "EXTERN"]
        
        var buddyToCount = [String:Int]()
        repeated(times: repetitions) {
            let pick = buddyList.pick(groups: groups)
            for (_, buddy) in pick { buddyToCount[buddy!.name] = (buddyToCount[buddy!.name] ?? 0) + 1 }
        }
        let buddyToPercentage = buddyToCount.percentages(repetitions * groups.count)
        
        return buddyToPercentage.map { $1 }.std()
    }
    
    private func repeated(times: Int, closure: () -> Void) { for _ in 0..<times { closure() } }
    
}

private extension Dictionary where Value: BinaryInteger {
    
    func percentages(_ total: Int) -> [Key:Double] {
        return mapValues { value in Double(value) / Double(total) }
    }
    
}

private extension Array where Element: FloatingPoint {
    func sum() -> Element { return reduce(0, +) }
    func average() -> Element { return sum() / Element(count) }
    func std() -> Element {
        let avg = average()
        let v = reduce(0, { $0 + ($1 - avg) * ($1 - avg)})
        return sqrt(v / (Element(count) - 1))
    }
}
