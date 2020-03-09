import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var firstBuddyTextField: NSTextField!
    @IBOutlet weak var secondBuddyTextField: NSTextField!
    @IBOutlet weak var firstBuddyImage: NSImageView!
    @IBOutlet weak var secondBuddyImage: NSImageView!
    
    private var pickMethod = RandomMethod()
    private var lastPickedBuddies = Array<Buddy>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pickButtonAction(_ sender: NSButton) {
        lastPickedBuddies = []
        
        let (buddy1, buddy2) = pickMethod.pickFrom(getBuddyList())
        
        if (buddy1 != nil && buddy2 != nil) {
            firstBuddyTextField.stringValue = buddy1!.name
            firstBuddyImage.image = NSImage(named: buddy1!.image)
            
            secondBuddyTextField.stringValue = buddy2!.name
            secondBuddyImage.image = NSImage(named: buddy2!.image)
            
            lastPickedBuddies = Array(arrayLiteral: buddy1!, buddy2!)
        } else if (buddy1 != nil && buddy2 == nil) {
            firstBuddyTextField.stringValue = buddy1!.name
            firstBuddyImage.image = NSImage(named: buddy1!.image)
            
            secondBuddyTextField.stringValue = "no other buddy present :("
            secondBuddyImage.image = nil
        } else if (buddy1 == nil && buddy2 != nil) {
            firstBuddyTextField.stringValue = "no other buddy present :("
            firstBuddyImage.image = nil
            
            secondBuddyTextField.stringValue = buddy2!.name
            secondBuddyImage.image = NSImage(named: buddy2!.image)
        } else {
            firstBuddyTextField.stringValue = "no buddies present at all :("
            firstBuddyImage.image = nil
            
            secondBuddyTextField.stringValue = ""
            secondBuddyImage.image = nil
        }
        
        sender.isEnabled = lastPickedBuddies.count == 2
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
