//
//  Lesson: Repository Pattern and AppDelegate
//

import Foundation

class RandomItemStore{
    
    var allItems: [Item] = []
    
    init() {
        for _ in 0..<5 {
            let newItem = Item(random: true)
            createItem(item:newItem)
        }
    }
    
    func createItem(item:Item) {
        allItems.append(item)
    }
    
}
