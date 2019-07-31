//
//  Lesson: Repository Pattern and AppDelegate
//

import UIKit
protocol ItemRepository {
    var allItems:[Item] { get set }
    func createItem(item:Item)
}

class ItemsViewController: UITableViewController {
    
    // TODO: Change the itemStore type to use the abstract "ItemRepository" protocol instead of the particular RandomItemStore class (IoC)
    var itemStore: RandomItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create an reusable instance of UITableViewCell,
            //  with default appearance
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            
            // Set the text and detail using the ItemRepository
            let item = itemStore.allItems[indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
            return cell
    }
}
