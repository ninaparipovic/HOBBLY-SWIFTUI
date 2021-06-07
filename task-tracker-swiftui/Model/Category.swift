//
//  Category.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import Foundation
import RealmSwift

class Category: Object, Identifiable {
    @objc dynamic var _id = 0
    @objc dynamic var title = ""
    @objc dynamic var image = "cookies"

    var activities = List<Activity>()

    override static func primaryKey() -> String? {
      "_id"
    }
}
