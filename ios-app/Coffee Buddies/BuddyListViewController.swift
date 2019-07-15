import UIKit

class BuddyListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BuddyListViewController loaded")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buddyList.buddies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "BuddyListItem", for: indexPath)
        
        let buddy = getBuddy(indexPath)
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let buddy = getBuddy(indexPath)
        buddy.switchPresent()
        tableView.reloadData()
    }
    
    private func getBuddy(_ indexPath: IndexPath) -> Buddy {
        return buddyList.buddies[indexPath.row]
    }
}
