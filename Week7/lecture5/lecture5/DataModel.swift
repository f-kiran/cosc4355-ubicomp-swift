//
//  DataModel.swift
//  lecture5
//
//  Created by Fettah KIRAN on 10/2/24.
//

import Foundation


// user model
struct Language: Codable {
    var id: Int
    var name: String
    var designed_by: String
    var logo: URL
    var first_appeared: Int
    var website: String
    var about: String
}
