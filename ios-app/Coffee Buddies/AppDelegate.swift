
import UIKit

let TABLE_ONE = "TABLE_ONE"
let TABLE_TWO = "TABLE_TWO"
let INTERN = "INTERN"
let EXTERN = "EXTERN"

let globalBuddyList = Array(arrayLiteral:
    Buddy(name: "Alexander", groups: [TABLE_TWO, INTERN]),
    Buddy(name: "Anja", groups: [TABLE_ONE, EXTERN]),
    Buddy(name: "Barbara", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Christian", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Dennis", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Florian", groups: [TABLE_TWO, INTERN]),
    Buddy(name: "Marco", groups: [TABLE_ONE, EXTERN]),
    Buddy(name: "Mareike", groups: [TABLE_TWO, INTERN]),
    Buddy(name: "Matthias", groups: [TABLE_ONE, INTERN]),
    Buddy(name: "Stefan G.", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Stefan L.", groups: [TABLE_TWO, EXTERN]),
    Buddy(name: "Stephan B.", groups: [TABLE_ONE, EXTERN])
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        loadTransientBuddyProperties()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        saveTransientBuddyProperties()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        saveTransientBuddyProperties()
    }

    private func saveTransientBuddyProperties() {
        globalBuddyList.forEach { buddy in
            var dictionary = [String : Any]()

            dictionary["present"] = buddy.present
            dictionary["pickedCount"] = buddy.pickedCount
            
            UserDefaults.standard.set(dictionary, forKey: keyOf(buddy))
        }
    }
    
    private func loadTransientBuddyProperties() {
        globalBuddyList.forEach { buddy in
            let dictionary = UserDefaults.standard.dictionary(forKey: keyOf(buddy)) ?? [String:Any]()
            
            buddy.pickedCount = dictionary["pickedCount"] as? Int ?? 0
            buddy.present = dictionary["present"] as? Bool ?? true
        }
    }
    
    private func keyOf(_ buddy: Buddy) -> String {
        return "buddy[\(buddy.name)]"
    }
    
}
