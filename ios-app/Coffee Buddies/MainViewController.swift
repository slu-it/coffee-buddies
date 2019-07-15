import UIKit

private let TABLE_ONE = "TABLE_ONE"
private let TABLE_TWO = "TABLE_TWO"
private let INTERN = "INTERN"
private let EXTERN = "EXTERN"

private let METHOD_RANDOM_INDEX = 0
private let METHOD_TABLE_INDEX = 1
private let METHOD_INTERN_EXTERN_INDEX = 2

class MainViewController: UIViewController {
    
    // TODO: should be stored in a database to be more flexible
    private let buddyList = BuddyList(
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
    
    @IBOutlet weak var methodSelector: UISegmentedControl!
    @IBOutlet weak var firstBuddyTextField: UITextField!
    @IBOutlet weak var secondBuddyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController loaded")
    }
    
    @IBAction func pickButtonAction(_ sender: UIButton, forEvent event: UIEvent) {
        switch methodSelector.selectedSegmentIndex {
        case METHOD_RANDOM_INDEX:
            pickTwoRandomly()
        case METHOD_TABLE_INDEX:
            pickOnePerTable()
        case METHOD_INTERN_EXTERN_INDEX:
            pickOneInternAndOneExtern()
        default:
            print("unkown method selected")
        }
    }
    
    private func pickTwoRandomly() {
        let buddies = Array(buddyList.pick(amount: 2))
        setFirstBuddy(buddies[0])
        setSecondBuddy(buddies[1])
    }
    
    private func pickOnePerTable() {
        let buddies = buddyList.pick(groups: [TABLE_ONE, TABLE_TWO])
        setFirstBuddy(buddies[TABLE_ONE]!)
        setSecondBuddy(buddies[TABLE_TWO]!)
    }
    
    private func pickOneInternAndOneExtern() {
        let buddies = buddyList.pick(groups: [INTERN, EXTERN])
        setFirstBuddy(buddies[INTERN]!)
        setSecondBuddy(buddies[EXTERN]!)
    }
    
    private func setFirstBuddy(_ buddy: Buddy) {
        firstBuddyTextField.text = buddy.name
    }
    
    private func setSecondBuddy(_ buddy: Buddy) {
        secondBuddyTextField.text = buddy.name
    }
    
}

enum Errors: Error {
    case unknownMethodSelected
}

