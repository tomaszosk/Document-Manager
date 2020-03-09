import Foundation
import UIKit

class Document {
    var name: String
    var type: String
    var dateAdded: String
    var image = UIImage(named: "")
    
    init(name: String, type: String, dateAdded: String, image: UIImage) {
        self.name = name
        self.type = type
        self.dateAdded = dateAdded
        self.image = image
    }
}
