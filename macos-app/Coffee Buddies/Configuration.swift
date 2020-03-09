import Foundation
import Cocoa

class BuddyListTableViewDataSource: NSObject, NSTableViewDataSource {
    
    private let buddyList: Array<Buddy>
    
    init(_ buddyList: Array<Buddy>) {
        self.buddyList = buddyList
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return buddyList.count
    }
    
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return buddyList[row]
    }
    
}

class BuddyListTableViewDelegate: NSObject, NSTableViewDelegate {
    
    private let buddyList: Array<Buddy>
    
    init(_ buddyList: Array<Buddy>) {
        self.buddyList = buddyList
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        // let buddy = buddyList[indexPath.row]
      //  buddy.switchPresent()
       // tableView.reloadData()
    }
    
}
