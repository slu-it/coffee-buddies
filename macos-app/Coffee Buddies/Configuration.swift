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

    private let buddyCellId = NSUserInterfaceItemIdentifier("BuddyCellId")
    private let presentCellId = NSUserInterfaceItemIdentifier("PresentCellId")
    
    private let buddyList: Array<Buddy>
    
    init(_ buddyList: Array<Buddy>) {
        self.buddyList = buddyList
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let buddy = buddyList[row]
        
        if tableColumn == tableView.tableColumns[0] {
            let cell = tableView.makeView(withIdentifier: buddyCellId, owner: nil) as? NSTableCellView
            cell?.textField?.stringValue = buddy.name
            cell?.imageView?.image = NSImage(named: buddy.image)
            return cell
        }
        
        if tableColumn == tableView.tableColumns[1] {
            let cell = tableView.makeView(withIdentifier: presentCellId, owner: nil) as? NSTableCellView
            cell?.textField?.stringValue = buddy.name
            cell?.imageView?.image = NSImage(named: buddy.image)
            return cell
        }

        return nil
    }
    
}
