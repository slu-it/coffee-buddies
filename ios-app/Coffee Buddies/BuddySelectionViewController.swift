import UIKit

private let METHOD_RANDOM_INDEX = 0
private let METHOD_TABLE_INDEX = 1
private let METHOD_INTERN_EXTERN_INDEX = 2

class BuddySelectionViewController: UIViewController {
    
    @IBOutlet weak var methodSelector: UISegmentedControl!
    @IBOutlet weak var firstBuddyTextField: UITextField!
    @IBOutlet weak var secondBuddyTextField: UITextField!
    @IBOutlet weak var pickButton: UIButton!
    
    private var lastPickedBuddies = Array<Buddy>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pickTwoBuddies() {
        lastPickedBuddies.removeAll()
        
        let methodIndex = methodSelector.selectedSegmentIndex
        if methodIndex == METHOD_RANDOM_INDEX {
            pickRandomly()
        } else if methodIndex == METHOD_TABLE_INDEX {
            pickOnePerTable()
        } else if methodIndex == METHOD_INTERN_EXTERN_INDEX {
            pickOneInternAndOneExtern()
        }
        
        if lastPickedBuddies.count == 2 {
            pickButton.isEnabled = true
        }
    }
    
    @IBAction func incrementPickedBuddyCounters() {
        pickButton.isEnabled = false
        lastPickedBuddies.forEach { buddy in buddy.incrementPickedCount() }
        lastPickedBuddies.removeAll()
    }
    
    private func pickRandomly() {
        let buddies = globalBuddyList.pick(amount: 2)
        lastPickedBuddies.append(contentsOf: buddies)
        
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
            lastPickedBuddies.append(buddy)
            firstBuddyTextField.text = buddy.name
        } else {
            firstBuddyTextField.text = "no buddy of table #1 present :("
        }
        
        if let buddy = buddies[TABLE_TWO] as? Buddy {
            lastPickedBuddies.append(buddy)
            secondBuddyTextField.text = buddy.name
        } else {
            secondBuddyTextField.text = "no buddy of table #2 present :("
        }
    }
    
    private func pickOneInternAndOneExtern() {
        let buddies = globalBuddyList.pick(groups: [INTERN, EXTERN])
        
        if let buddy = buddies[INTERN] as? Buddy {
            lastPickedBuddies.append(buddy)
            firstBuddyTextField.text = buddy.name
        } else {
            firstBuddyTextField.text = "no internal buddy present :("
        }
        
        if let buddy = buddies[EXTERN] as? Buddy {
            lastPickedBuddies.append(buddy)
            secondBuddyTextField.text = buddy.name
        } else {
            secondBuddyTextField.text = "no external buddy present :("
        }
    }
    
}
