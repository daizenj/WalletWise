
//
//  User.swift
//  ReMed3
//
//  Created by Jose Ortiz on 4/14/23.
//

import Foundation
import ParseSwift

struct Transaction: ParseObject {
    // These are required by `ParseObject`.
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // These are required by `ParseUser`.
    var company : String?
    var cost : Double?
    var type : String?
    var date : Date?
    var User : User?

}

