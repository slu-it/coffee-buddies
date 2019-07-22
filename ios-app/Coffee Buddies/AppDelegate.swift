
import UIKit

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
        getBuddyList().forEach { buddy in
            var dictionary = [String : Any]()

            dictionary["present"] = buddy.present
            dictionary["pickedCount"] = buddy.pickedCount
            
            UserDefaults.standard.set(dictionary, forKey: keyOf(buddy))
        }
    }
    
    private func loadTransientBuddyProperties() {
        getBuddyList().forEach { buddy in
            let dictionary = UserDefaults.standard.dictionary(forKey: keyOf(buddy)) ?? [String:Any]()
            
            buddy.pickedCount = dictionary["pickedCount"] as? Int ?? 0
            buddy.present = dictionary["present"] as? Bool ?? true
        }
    }
    
    private func keyOf(_ buddy: Buddy) -> String {
        return "buddy[\(buddy.name)]"
    }
    
}
