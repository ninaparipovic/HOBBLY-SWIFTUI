//
//  SearchView.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/11/21.
//

import SwiftUI
import RealmSwift

struct SearchView: View {
    let activities: [Activity]
    let categories: [String]
    @State private var searchInput: String = ""
    @EnvironmentObject var activityStore: ActivityStore
    @EnvironmentObject var state: AppState

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField("Users, activities or interests", text: $searchInput)
                    .font(Font.custom("Futura", size: 16))
                    .padding(.all, 5)
                    .background(Color(red: 0.102, green: 0.369, blue: 0.388))
                    .opacity(0.65)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.body)
                Spacer()
            }
            .padding(30)
            ScrollView {
                ForEach(categories, id: \.self) { cat in
                    Text(cat)
                        .font(Font.custom("Futura", size: 33))
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(sort(category: cat)) { activity in
                                ActivityCell(activity: activity)
                                    .environmentObject(state)

                            }
                        }

                    }
                }

                   }
            Spacer()
        }
    }
    func sort(category: String) -> Results<Activity> {
        var predicate: String
        if searchInput.isEmpty {
            predicate = "categoryName == %@"
            let filteredActivities = activityStore.acitvityResults.filter(predicate, category)
            return filteredActivities
        } else {
            predicate = "categoryName == %@ AND title CONTAINS[c] %@"
            let filteredActivities = activityStore.acitvityResults.filter(predicate, category, searchInput)
            return filteredActivities

        }
    }
}
