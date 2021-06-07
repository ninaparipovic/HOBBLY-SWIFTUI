//
//  ActivityStore.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import Foundation
import RealmSwift

final class ActivityStore: ObservableObject {
  private var acitvityResults: Results<Activity>

  init(realm: Realm) {
    acitvityResults = realm.objects(Activity.self)
  }

  var activities: [Activity] {
    acitvityResults.map(Activity.init)
  }
}

// MARK: - CRUD Actions
extension ActivityStore {

    // need to specify which category
    func create(title: String) -> Activity {
    objectWillChange.send()

        let activity = Activity()
          activity._id = UUID().hashValue
          activity.title = title

    do {
      let realm = try Realm()

      try realm.write {
        realm.add(activity)
      }
        return activity
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
        return activity
  }

    func createWithCategory(title: String, category: Category) {
    objectWillChange.send()

        let activity = Activity()
          activity._id = UUID().hashValue
          activity.title = title
//          activity.category = category

    do {
      let realm = try Realm()

      try realm.write {
        realm.add(activity)
        category.activities.append(activity)

      }
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
  }

//  func toggleBought(ingredient: Ingredient) {
//    objectWillChange.send()
//    do {
//      let realm = try Realm()
//      try realm.write {
//        realm.create(
//          IngredientDB.self,
//          value: ["id": ingredient.id, "bought": !ingredient.bought],
//          update: .modified)
//      }
//    } catch let error {
//      // Handle error
//      print(error.localizedDescription)
//    }
//  }

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
