//
//  Activity.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import Foundation
import RealmSwift

class Activity: Object, Identifiable {
    @objc dynamic var _id = 0
    @objc dynamic var _partition = ""
    @objc dynamic var title = ""
    @objc dynamic var image = "cookies"
    @objc dynamic var imageIndex = 0
    @objc dynamic var duration = 0
    @objc dynamic var cost = 0
    @objc dynamic var location =  "Hanover, NH"
    @objc dynamic var details =  "this is the description"
    @objc dynamic var categoryName = ""

    override static func primaryKey() -> String? {
      "_id"
    }
}
