import UIKit

class ConfigurationViewController: UIViewController {
    
    private var buddyListTableViewDataSource: BuddyListTableViewDataSource?
    private var buddyListTableViewDelegate: BuddyListTableViewDelegate?
    
    @IBOutlet weak var buddyListTableView: UITableView!
    
    override func viewDidLoad() {
        buddyListTableViewDataSource = BuddyListTableViewDataSource(globalBuddyList)
        buddyListTableViewDelegate = BuddyListTableViewDelegate(globalBuddyList)
        
        buddyListTableView.dataSource = buddyListTableViewDataSource
        buddyListTableView.delegate = buddyListTableViewDelegate
        super.viewDidLoad()
    }
    
}

private class BuddyListTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let buddyList: BuddyList
    
    init(_ buddyList: BuddyList) {
        self.buddyList = buddyList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buddyList.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "BuddyListItem", for: indexPath)
        
        let buddy = buddyList.getBuddyAt(index: indexPath.row)
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = buddy.name
        }
        
        if buddy.present {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        return cell
    }
    
}

private class BuddyListTableViewDelegate: NSObject, UITableViewDelegate {
    
    private let buddyList: BuddyList
    
    init(_ buddyList: BuddyList) {
        self.buddyList = buddyList
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let buddy = buddyList.getBuddyAt(index: indexPath.row)
        buddy.switchPresent()
        tableView.reloadData()
    }
    
}
