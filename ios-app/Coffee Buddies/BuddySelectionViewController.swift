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
    
    @IBAction func pickTwoBuddies() {
        let methodIndex = methodSelector.selectedSegmentIndex
        if methodIndex == METHOD_RANDOM_INDEX {
            pickRandomly()
        } else if methodIndex == METHOD_TABLE_INDEX {
            pickOnePerTable()
        } else if methodIndex == METHOD_INTERN_EXTERN_INDEX {
            pickOneInternAndOneExtern()
        }
    }
    
    private func pickRandomly() {
        let buddies = globalBuddyList.pick(amount: 2)
        buddies.forEach { buddy in buddy.incrementPickedCount() }
        
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
        buddies.values.forEach { buddy in buddy?.incrementPickedCount() }
        
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
        buddies.values.forEach { buddy in buddy?.incrementPickedCount() }
        
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
