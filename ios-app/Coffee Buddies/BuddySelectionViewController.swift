import UIKit

class BuddySelectionViewController: UIViewController {
    
    @IBOutlet weak var methodPicker: UIPickerView!
    @IBOutlet weak var firstBuddyTextField: UITextField!
    @IBOutlet weak var secondBuddyTextField: UITextField!
    @IBOutlet weak var pickButton: UIButton!
    
    private var methodPickerViewController = MethodPickerViewController()
    private var lastPickedBuddies = Array<Buddy>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        methodPicker.dataSource = methodPickerViewController
        methodPicker.delegate = methodPickerViewController
    }
    
    @IBAction func pickTwoBuddies() {
        lastPickedBuddies = []
        
        let method = methodPickerViewController.getSelectedMethod()
        let (buddy1, buddy2) = method.pickFrom(getBuddyList())
        
        if (buddy1 != nil && buddy2 != nil) {
            firstBuddyTextField.text = buddy1!.name
            secondBuddyTextField.text = buddy2!.name
            lastPickedBuddies = Array(arrayLiteral: buddy1!, buddy2!)
        } else if (buddy1 != nil && buddy2 == nil) {
            firstBuddyTextField.text = buddy1!.name
            secondBuddyTextField.text = "no other buddy present :("
        } else if (buddy1 == nil && buddy2 != nil) {
            firstBuddyTextField.text = "no other buddy present :("
            secondBuddyTextField.text = buddy2!.name
        } else {
            firstBuddyTextField.text = "no buddies present at all :("
            secondBuddyTextField.text = ""
        }
        
        pickButton.isEnabled = lastPickedBuddies.count == 2
    }
    
    @IBAction func incrementPickedBuddyCounters() {
        pickButton.isEnabled = false
        lastPickedBuddies.forEach { buddy in buddy.incrementPickedCount() }
        lastPickedBuddies = []
    }
    
}
