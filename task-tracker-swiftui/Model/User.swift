//
//  User.swift
//  task-tracker-swiftui
//
//

import Foundation
import RealmSwift

@objcMembers class User: Object, ObjectKeyIdentifiable {
    dynamic var _id: String = UUID().uuidString
    dynamic var _partition: String = ""
    dynamic var name: String = ""

    override static func primaryKey() -> String? {
        return "_id"
    }
}
