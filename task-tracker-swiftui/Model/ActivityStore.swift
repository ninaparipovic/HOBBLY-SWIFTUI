//
//  ActivityStore.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import Foundation
import RealmSwift

final class ActivityStore: ObservableObject {
   var acitvityResults: Results<Activity>

  init(realm: Realm) {
    acitvityResults = realm.objects(Activity.self)
  }

  var activities: [Activity] {
    acitvityResults.map(Activity.init)
  }
}

// MARK: - CRUD Actions
extension ActivityStore {

    func create(title: String, duration: Int, cost: Int, location: String, categoryName: String, details: String, image: String) {
    objectWillChange.send()

        let activity = Activity()
          activity._id = UUID().hashValue
          activity.title = title + ""
          activity.duration = duration
          activity.cost = cost
          activity.location = location
          activity.categoryName = categoryName
          activity.image = image
          activity.details = details

    do {
      let realm = try Realm()
      try realm.write {
        realm.add(activity)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }

  func update(
    activityID: Int,
    title: String
  ) {
    objectWillChange.send()
    do {
      let realm = try Realm()
      try realm.write {
        realm.create(
          Activity.self,
          value: [
            "_id": activityID,
            "title": title
          ],
          update: .modified)
      }
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
  }

  func delete(activityID: Int) {
    // 1
    objectWillChange.send()
    // 2
    guard let activity = acitvityResults.first(
      where: { $0._id == activityID })
      else { return }

    do {
      let realm = try Realm()
      try realm.write {
        realm.delete(activity)
      }
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
  }
}
