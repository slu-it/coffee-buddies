import UIKit

private let METHOD_RANDOM_INDEX = 0
private let METHOD_TABLE_INDEX = 1
private let METHOD_INTERN_EXTERN_INDEX = 2

class MainViewController: UIViewController {
    
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

