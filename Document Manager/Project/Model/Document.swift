import Foundation

class Document {
    var name: String
    var size: Int
    var type: String
    var dateAdded: String
    var privacy: String
    
    init(name: String, size: Int, type: String, dateAdded: String, privacy: String) {
        self.name = name
        self.size = size
        self.type = type
        self.dateAdded = dateAdded
        self.privacy = privacy
    }
}
