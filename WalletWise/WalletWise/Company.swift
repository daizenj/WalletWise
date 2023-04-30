
import Foundation
import ParseSwift


struct Company: ParseObject {
    
    // These are required by `ParseObject`.
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // These are required by `ParseUser`.
    var name: String?
    var image: ParseFile?

}

