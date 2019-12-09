import Foundation

class Document {
    var name: String
    var size: Int
    var dateAdded: DateFormatter
    var privacy: String
    
    init(name: String, size: Int, dateAdded: DateFormatter, privacy: String) {
        self.name = name
        self.size = size
        self.dateAdded = dateAdded
        self.privacy = privacy
    }
}
