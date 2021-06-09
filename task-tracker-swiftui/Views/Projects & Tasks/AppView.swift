//
//  AppView.swift
//  task-tracker-swiftui
//
//  Created by Andrew Morgan on 03/11/2020.
//

import SwiftUI
import RealmSwift

struct AppView: View {
    @EnvironmentObject var state: AppState
    @EnvironmentObject var activityStore: ActivityStore
    @EnvironmentObject var categoryStore: CategoryStore

    var number: Int = 7

    @State var projectName = ""
    @State var showingTasks = false
    @State var showingSheet = false
    @State var projectToOpen: Project?
    var isPreview = false

    private enum Dimensions {
        static let padding: CGFloat = 16.0
    }

    @State var selectedIndex = 0
    @State var addModal = false

    @State private var ActivityName = ""
    @State private var ActivityPrice = ""
    @State private var timeSelection: Int = 0

    let tabBarImageNames = ["house.fill", "person.2.fill", "plus.circle", "magnifyingglass", "person.fill"]
    let tabBarNames = ["Home", "Community", "Add", "Search", "Profile"]

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $addModal, content: {

                        VStack {
                            VStack {
                                ForEach(categoryStore.categories) { category in
                                    Text(category.title)
                                    ForEach(category.activities) { activity in
                                        Text(activity.title)
                                    }
                                    Button("add activity") {
                                        categoryStore.addActivity2(category: category, title: "hi")
    //                                    let activity = activityStore.create(title: "new boi")
    //                                    let activity = Activity()
    //                                    activity._id = UUID().hashValue
    //                                    activity.title = "activity title"
    //                                    categoryStore.addActivity(category: category, activity: activity)
                                        print(category.activities)
    //                                    category.activities.append(activity)
                                    }
                                    Button("delete category") {
                                        categoryStore.delete(categoryID: category._id)
                                    }
                                }
    //                            ForEach(activityStore.activities) { activity in
    //                                Text(activity.title)
    //                            }

                                Button("add category") {
                                    categoryStore.create(title: "sup")
                                }

                            }
                            Section(header: Text("name")) {
                                TextField("", text: $ActivityName)
                            }
                            Section(header: Text("price")) {
                                TextField("", text: $ActivityPrice)
                            }
                            Button(action: {addModal.toggle()}, label: {
                                Text("dismiss modal")
                            })
                        }
                    })
                switch selectedIndex {
                case 0:
                    NavigationView {
                        HomeView(activities: activityStore.activities, categories: categoryStore.categories)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                    }
                case 1:
                    NavigationView {
                        CommunityView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                case 3:
                    NavigationView {
                        SearchView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                default:
                    NavigationView {
                        ProfileView(user: state.user)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                }
            }
            Divider()
                .padding(.bottom, 12)
            HStack {
                ForEach(0..<tabBarImageNames.count) { num in
                    VStack {
                        Button(action: {
                            if num == 2 {
                                addModal.toggle()
                                // why do you need to return?
                                return
                            }
                            selectedIndex = num
                        }, label: {
                            Spacer()
                            if num == 2 {
                                Image(systemName: tabBarImageNames[num])
                                    .font(.system(size: 40, weight: .bold))
                                    .foregroundColor(.orange)
                            } else {
                                Image(systemName: tabBarImageNames[num])
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))

                            }

                            Spacer()
                        })
                        if num != 2 {
                            Text("\(tabBarNames[num])")
                                .font(.system(size: 12, weight: .light))
                        }
                    }

                }
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        let state = AppState()
        let realm = try! Realm()
//        let store = ActivityStore(realm: realm)
        state.user = .sample

        return AppearancePreviews(
            NavigationView {
                AppView(isPreview: true)
                    .environmentObject(state)
//                    .environmentObject(store)
            }
        )
    }
}
