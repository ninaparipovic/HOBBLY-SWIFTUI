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

      try realm.write {
        realm.add(category)
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
