//
//  HomeView.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/10/21.
//

import SwiftUI
//import RealmSwift

struct HomeView: View {
//    var item: Activity = testData[0].activities[0]
//    @ObservedObject var store: ActivityStore
//    @ObservedResults(Activity2.self) var activities
//    @EnvironmentObject var modelData: Activity2
    let activities: [Activity]
    @EnvironmentObject var store: ActivityStore

    @State private var time: String = "20 minutes"
    @State private var timeSelection: Int = 0

    var body: some View {
//        VStack {
//            ForEach(activities) { activity in
//                Text(activity.title)
//                Image(activity.image)
//                    .resizable()
//                    .frame(width: 130, height: 130)
//            }
//            Button("add") {
//                store.create(title: "new activity")
//            }
//        }
        ScrollView {
            VStack {
                MinutesSelector(timeSelection: $timeSelection)
                    .frame(width: 260, height: 60)
                    .cornerRadius(7)
                ForEach(1 ..< 6) { num in
                    Text("Category\(num)")
                        .font(.title)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(activities) { activity in
                                ActivityCell(activity: activity)

                            }
                        }
                    }
                }

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
                    Image(activity.image)
                    .resizable()
                    .frame(width: 140.0, height: 140.0)
                    .cornerRadius(7)
                Text(activity.title)
                    .accentColor(.black)
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
