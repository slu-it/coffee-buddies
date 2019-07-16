import UIKit

private let NAME_LABEL_TAG = 1000

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
    
    override func viewWillAppear(_ animated: Bool) {
        buddyListTableView.reloadData()
        super.viewWillAppear(animated)
    }
    
}

private class BuddyListTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let buddyList: Array<Buddy>
    
    init(_ buddyList: Array<Buddy>) {
        self.buddyList = buddyList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buddyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "BuddyListItem", for: indexPath)
        
        let buddy = buddyList[indexPath.row]
        
        if let label = cell.viewWithTag(NAME_LABEL_TAG) as? UILabel {
            label.text = "\(buddy.name) (\(buddy.pickedTimes))"
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
    
    private let buddyList: Array<Buddy>
    
    init(_ buddyList: Array<Buddy>) {
        self.buddyList = buddyList
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let buddy = buddyList[indexPath.row]
        buddy.switchPresent()
        tableView.reloadData()
    }
    
}
