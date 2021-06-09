//
//  HomeView.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/10/21.
//

import SwiftUI
import RealmSwift

struct HomeView: View {
    //    var item: Activity = testData[0].activities[0]
    //    @ObservedObject var store: ActivityStore
    //    @ObservedResults(Activity2.self) var activities
    //    @EnvironmentObject var modelData: Activity2
    let activities: [Activity]
//    let categories: [Category]
    @EnvironmentObject var activityStore: ActivityStore
    @EnvironmentObject var categoryStore: CategoryStore

    @State private var time: String = "20 minutes"
    let numbers = [15, 30, 45, 60, 90]
    @State private var timeSelection: Int = 4
    let categories: [String]
    var currCategory: String = "Food"
//    lazy var filteredActivities = activityStore.acitvityResults.filter("duration <= %@ AND categoryName == %@", numbers[timeSelection], currCategory)

    //    let predicate = NSPredicate(format: "duration > %@", timeSelection)

    var body: some View {
        ScrollView {
            VStack {
                MinutesSelector(timeSelection: $timeSelection, numbers: numbers)
                    .frame(width: 260, height: 60)
                    .cornerRadius(7)
//                ForEach(categories) { category in
//                    Text(category)
//                        .font(Font.custom("Futura", size: 33))
//                    ScrollView(.horizontal) {
////                        ForEach(category.activities) { activity in
////                            ActivityCell(activity: activity)
////                        }
//                    }
//                }
                ForEach(categories, id: \.self) { cat in
                    Text(cat)
                        .font(Font.custom("Futura", size: 33))
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(sort(category: cat)) { activity in
                                ActivityCell(activity: activity)
                            }
                        }

                    }

                }
//                Button("sort") {
//                    sort()
//                }

                //            Text("Baking")
                //            HStack {
                //                NavigationLink(destination: ActivityDetail(activity: item)) {
                //                    VStack {
                //                        Image("kaf1")
                //                            .resizable()
                //                            .frame(width: 130, height: 130)
                //                        Text("KAF")
                //                    }
                //                }
                //                NavigationLink(destination: ActivityDetail(activity: item)) {
                //                    VStack {
                //                        Image("kaf1")
                //                            .resizable()
                //                            .frame(width: 130, height: 130)
                //                        Text("KAF")
                //                    }
                //                }
                //            }
                //            Text("Cooking")
                //            HStack {
                //                NavigationLink(destination: ActivityDetail(activity: item)) {
                //                    VStack {
                //                        Image("kaf1")
                //                            .resizable()
                //                            .frame(width: 130, height: 130)
                //                        Text("KAF")
                //                    }
                //                }
                //                NavigationLink(destination: ActivityDetail(activity: item)) {
                //                    VStack {
                //                        Image("kaf1")
                //                            .resizable()
                //                            .frame(width: 130, height: 130)
                //                        Text("KAF")
                //                    }
                //                }
                //            }
                //            Text("Eating out")
                //            HStack {
                //                NavigationLink(destination: ActivityDetail(activity: item)) {
                //                    VStack {
                //                        Image("kaf1")
                //                            .resizable()
                //                            .frame(width: 130, height: 130)
                //                        Text("KAF")
                //                    }
                //                }
                //                NavigationLink(destination: ActivityDetail(activity: item)) {
                //                    VStack {
                //                        Image("kaf1")
                //                            .resizable()
                //                            .frame(width: 130, height: 130)
                //                        Text("KAF")
                //                    }
                //                }
                //            }
                //
                //            Spacer()
            }
        }
        //
        //
        //        .navigationTitle("I have: ")
    }

    func sort(category: String) -> Results<Activity> {
        let filteredActivities = activityStore.acitvityResults.filter("duration <= %@ AND categoryName == %@", numbers[timeSelection], category)
        print(" there are this many \(filteredActivities.count)")
                for a in filteredActivities {
                    print(a.title)
                }
        return filteredActivities
//        for a in filteredActivities {
//            print(a.duration)
//        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            HomeView(store: ActivityStore(activityCategories: testData))
//        }
//    }
//}

struct ActivityCell: View {
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
            //            if activity.isFavorite {
            //                // If the user "favorited" the Activity, display a heart icon
            //                Image(systemName: "heart.fill")
            //            }
        }
    }
}
