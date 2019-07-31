//
//  Lesson: Repository Pattern and AppDelegate
//

import Foundation

struct Item {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date = Date()
    
    init( name: String, valueInDollars: Int){
        self.name = name ; self.valueInDollars = valueInDollars
        self.serialNumber = UUID().uuidString.components(separatedBy: "-").first!
    }
    
    init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny", "Silver", "Gold"]
            let nouns = ["Bear", "Spork", "Mac", "Bow", "Airplane"]
            
            let randomAdjective = adjectives.randomElement()
            let randomNoun = nouns.randomElement()
            
            name = "\(randomAdjective!) \(randomNoun!)"
            valueInDollars = Int.random(in:1...100)
            serialNumber = UUID().uuidString.components(separatedBy: "-").first!
        }
        else {
            name = ""
            serialNumber = nil
            valueInDollars = 0
        }
    }
    
}
