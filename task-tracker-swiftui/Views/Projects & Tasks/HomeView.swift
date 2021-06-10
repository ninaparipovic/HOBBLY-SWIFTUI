//
//  HomeView.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/10/21.
//

import SwiftUI
import RealmSwift
import UIKit

struct HomeView: View {
    @EnvironmentObject var state: AppState
    let activities: [Activity]
    @EnvironmentObject var activityStore: ActivityStore

    @State private var time: String = "20 minutes"
    let numbers = [15, 30, 45, 60, 90]
    @State private var timeSelection: Int = 4
    let categories: [String]
    var currCategory: String = "Food"

    var body: some View {
        ScrollView {
            VStack {
                MinutesSelector(timeSelection: $timeSelection, numbers: numbers)
                    .frame(width: 260, height: 60)
                    .cornerRadius(7)
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
        }
    }

    func sort(category: String) -> Results<Activity> {
        let filteredActivities = activityStore.acitvityResults.filter("duration <= %@ AND categoryName == %@", numbers[timeSelection], category)
        return filteredActivities
    }
}

struct ActivityCell: View {
    @EnvironmentObject var state: AppState
    let activity: Activity

    var body: some View {
        ZStack {
            NavigationLink(destination: ActivityDetail(activity: activity)) {
                VStack {
                    Text(activity.title)
                        .accentColor(.black)
                        .font(Font.custom("Futura", size: 18))
                    Image(activity.image)
                        .resizable()
                        .frame(width: 140.0, height: 140.0)
                        .cornerRadius(7)
                    HStack {
                        Text(activity.location)
                            .accentColor(.black)
                            .font(Font.custom("Futura", size: 11))
                        Spacer()
                        Text("\(activity.duration) min")
                            .accentColor(.black)
                            .font(Font.custom("Futura", size: 11))

                    }

                }
            }
            .padding(.leading, 20)
        }
    }
}
