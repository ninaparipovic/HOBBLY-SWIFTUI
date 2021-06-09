//
//  CategoryStore.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import Foundation
import RealmSwift

final class CategoryStore: ObservableObject {
  private var categoryResults: Results<Category>

  init(realm: Realm) {
    categoryResults = realm.objects(Category.self)
  }

  var categories: [Category] {
    categoryResults.map(Category.init)
  }
}

// MARK: - CRUD Actions
extension CategoryStore {
  func create(title: String) {
    objectWillChange.send()

    do {
      let realm = try Realm()
      let category = Category()
        category._id = UUID().hashValue
        category.title = title

        let activity = Activity()
        activity._id = UUID().hashValue
        activity.title = title
        activity.duration = 10

        let activity2 = Activity()
        activity2._id = UUID().hashValue
        activity2.title = title
        activity.duration = 30

      try realm.write {
        realm.add(category)
        realm.add(activity)
        realm.add(activity2)
        category.activities.append(activity)
        category.activities.append(activity2)

      }
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
  }

    func addActivity(category: Category, activity: Activity) {
        objectWillChange.send()
        do {
          let realm = try Realm()
          try realm.write {
            category.activities.append(activity)
          }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }

    func addActivity2(category: Category, title: String) {
        objectWillChange.send()

        let activity = Activity()
          activity._id = UUID().hashValue
          activity.title = title

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
    categoryID: Int,
    title: String
  ) {
    objectWillChange.send()
    do {
      let realm = try Realm()
      try realm.write {
        realm.create(
          Category.self,
          value: [
            "_id": categoryID,
            "title": title
          ],
          update: .modified)
      }
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
  }

  func delete(categoryID: Int) {
    // 1
    objectWillChange.send()
    // 2
    guard let category = categoryResults.first(
      where: { $0._id == categoryID })
      else { return }

    do {
      let realm = try Realm()
      try realm.write {
        realm.delete(category)
      }
    } catch let error {
      // Handle error
      print(error.localizedDescription)
    }
  }
}
