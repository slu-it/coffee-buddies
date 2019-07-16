import UIKit

private let METHOD_RANDOM_INDEX = 0
private let METHOD_TABLE_INDEX = 1
private let METHOD_INTERN_EXTERN_INDEX = 2

class BuddySelectionViewController: UIViewController {
    
    @IBOutlet weak var methodSelector: UISegmentedControl!
    @IBOutlet weak var firstBuddyTextField: UITextField!
    @IBOutlet weak var secondBuddyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pickButtonAction(_ sender: UIButton, forEvent event: UIEvent) {
        switch methodSelector.selectedSegmentIndex {
        case METHOD_RANDOM_INDEX: pickTwoRandomly()
        case METHOD_TABLE_INDEX: pickOnePerTable()
        case METHOD_INTERN_EXTERN_INDEX: pickOneInternAndOneExtern()
        default: print("unkown method selected")
        }
    }
    
    private func pickTwoRandomly() {
        let buddies = Array(globalBuddyList.pick(amount: 2))
        
        if buddies.count == 2 {
            firstBuddyTextField.text = buddies[0].name
            secondBuddyTextField.text = buddies[1].name
        } else if buddies.count == 1 {
            firstBuddyTextField.text = buddies[0].name
            secondBuddyTextField.text = "no other buddy present :("
        } else {
            firstBuddyTextField.text = "no buddies present at all :("
            secondBuddyTextField.text = ""
        }
    }
    
    private func pickOnePerTable() {
        let buddies = globalBuddyList.pick(groups: [TABLE_ONE, TABLE_TWO])
        
        if let buddy = buddies[TABLE_ONE] as? Buddy {
            firstBuddyTextField.text = buddy.name
        } else {
            firstBuddyTextField.text = "no buddy of table #1 present :("
        }
        
        if let buddy = buddies[TABLE_TWO] as? Buddy {
            secondBuddyTextField.text = buddy.name
        } else {
            secondBuddyTextField.text = "no buddy of table #2 present :("
        }
    }
    
    private func pickOneInternAndOneExtern() {
        let buddies = globalBuddyList.pick(groups: [INTERN, EXTERN])
        
        if let buddy = buddies[INTERN] as? Buddy {
            firstBuddyTextField.text = buddy.name
        } else {
            firstBuddyTextField.text = "no internal buddy present :("
        }
        
        if let buddy = buddies[EXTERN] as? Buddy {
            secondBuddyTextField.text = buddy.name
        } else {
            secondBuddyTextField.text = "no external buddy present :("
        }
    }
    
}
