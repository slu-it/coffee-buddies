import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        loadTransientBuddyProperties()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        saveTransientBuddyProperties()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
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
