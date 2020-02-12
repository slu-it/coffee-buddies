//
//  ViewController.swift
//  Coffee Buddies
//
//  Created by Stefan on 15.07.19.
//  Copyright © 2019 Stefan Ludwig. All rights reserved.
//

import Cocoa

private let TABLE_ONE = "TABLE_ONE"
private let TABLE_TWO = "TABLE_TWO"
private let INTERN = "INTERN"
private let EXTERN = "EXTERN"

private let METHOD_RANDOM_INDEX = 0
private let METHOD_TABLE_INDEX = 1
private let METHOD_INTERN_EXTERN_INDEX = 2

class ViewController: NSViewController {

    // TODO: should be stored in a database to be more flexible
    private let buddyList = BuddyList(
        buddies: [
            Buddy(name: "Matthias", image: "matthias_1", groups: [TABLE_ONE, INTERN]),
            Buddy(name: "Barbara", image: "barbara_1", groups: [TABLE_ONE, INTERN]),
            Buddy(name: "Dennis", image: "dennis_2", groups: [TABLE_ONE, INTERN]),
            Buddy(name: "Stephan B.", image: "stephan_b_1", groups: [TABLE_ONE, EXTERN]),
            Buddy(name: "Anja", image: "anja_1", groups: [TABLE_ONE, EXTERN]),
            Buddy(name: "Marco", image: "marco_1", groups: [TABLE_ONE, EXTERN]),
            Buddy(name: "Christian", image: "christian_2", groups: [TABLE_TWO, EXTERN]),
            Buddy(name: "Stefan L.", image: "stefan_l_1", groups: [TABLE_TWO, EXTERN]),
            Buddy(name: "Stefan G.", image: "stefan_g_1", groups: [TABLE_TWO, EXTERN]),
            Buddy(name: "Alexander", image: "alexander_1", groups: [TABLE_TWO, INTERN]),
            Buddy(name: "Florian", image: "florian_1", groups: [TABLE_TWO, INTERN]),
            Buddy(name: "Nadine", image: "nadine_1", groups: [TABLE_TWO, EXTERN])
        ]
    )
    
    @IBOutlet weak var methodSelector: NSSegmentedControl!
    
    @IBOutlet weak var firstBuddyTextField: NSTextField!
    @IBOutlet weak var secondBuddyTextField: NSTextField!
    @IBOutlet weak var firstBuddyImage: NSImageView!
    @IBOutlet weak var secondBuddyImage: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pickButtonAction(_ sender: NSButton) {
        switch methodSelector.selectedSegment {
            case METHOD_RANDOM_INDEX:
                pickRandomly()
            case METHOD_TABLE_INDEX:
                pickOneForEachTable()
            case METHOD_INTERN_EXTERN_INDEX:
                pickOneInternalAndOneExternal()
            default:
                print("unkown method selected")
        }
    }
    
    private func pickRandomly() {
        let buddies = Array(buddyList.pick(amount: 2))
        setFirstBuddy(buddies[0])
        setSecondBuddy(buddies[1])
    }
    
    private func pickOneForEachTable() {
        let buddies = buddyList.pick(groups: [TABLE_ONE, TABLE_TWO])
        setFirstBuddy(buddies[TABLE_ONE]!)
        setSecondBuddy(buddies[TABLE_TWO]!)
    }
    
    private func pickOneInternalAndOneExternal() {
        let buddies = buddyList.pick(groups: [INTERN, EXTERN])
        setFirstBuddy(buddies[INTERN]!)
        setSecondBuddy(buddies[EXTERN]!)
    }
    
    private func setFirstBuddy(_ buddy: Buddy) {
        firstBuddyTextField.stringValue = buddy.name
        firstBuddyImage.image = NSImage(named: buddy.image)
    }
    
    private func setSecondBuddy(_ buddy: Buddy) {
        secondBuddyTextField.stringValue = buddy.name
        secondBuddyImage.image = NSImage(named: buddy.image)
    }
    
}
