import Foundation
import UIKit

class Document {
    
    var name: String
    var type: String
    var dateAdded: String
    var image: Data
    var notes: String
    
    init(name: String, type: String, dateAdded: String, image: UIImage, notes: String) {
        self.name = name
        self.type = type
        self.dateAdded = dateAdded
        self.image = image.pngData()!
        self.notes = notes
    }
}


//extension UIImage {
//
//    func isEqualToImage(_ image: UIImage) -> Bool {
//        return self.pngData() == image.pngData()
//    }
//
//}
