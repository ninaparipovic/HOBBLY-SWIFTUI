//
//  AppView.swift
//
//

import SwiftUI
import RealmSwift

struct AppView: View {
    @EnvironmentObject var state: AppState
    @EnvironmentObject var activityStore: ActivityStore

    var number: Int = 7

    @State var projectName = ""
    @State var showingTasks = false
    @State var showingSheet = false
    var isPreview = false

    private enum Dimensions {
        static let padding: CGFloat = 16.0
    }

    @State var selectedIndex = 1
    @State var addModal = false

    @State private var ActivityTitle = ""
    @State private var ActivityCost = ""
    @State private var ActivityDuration = ""
    @State private var ActivityLocation = ""
    @State private var CategoryName = ""
    @State private var ActivityDetails = ""
    @State private var CategoryIndex = 0

    @State private var timeSelection: Int = 0

    let tabBarImageNames = [ "plus.circle", "house.fill", "magnifyingglass", "person.fill"]
    let tabBarNames = [ "Add", "Home", "Search", "Profile"]
    let categories = ["Food", "Art", "Fitness", "Outdoors", "Education"]

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                            VStack(spacing: 0) {
                                    Text("ADD AN ACTIVITY")
                                        .font(Font.custom("Futura", size: 33))
                                    InputField(title: "Title", text: $ActivityTitle)
                                        .padding(.all, 5)
                                    InputField(title: "Cost", text: $ActivityCost)
                                        .padding(.all, 5)
                                    InputField(title: "Duration", text: $ActivityDuration)
                                        .padding(.all, 5)
                                    InputField(title: "Location", text: $ActivityLocation)
                                        .padding(.all, 5)
                                    InputField(title: "Description", text: $ActivityDetails)
                                        .padding(.all, 5)
                                    CaptionLabel(title: "Category")
                                        .padding(.all, 5)
                                    ZStack {
                                        Color(red: 0.102, green: 0.369, blue: 0.388)
                                        VStack {
                                            Picker("Number", selection: $CategoryIndex) {
                                                           ForEach(0..<categories.count) { index in
                                                               Text("\(self.categories[index])")
                                                                .foregroundColor(Color.white)
                                                           }
                                            }
                                                            .frame(width: 100, height: 70)
                                                            .clipped()
                                            .foregroundColor(Color.white)
                                            Spacer()
                                        }
                                    }
                                    .frame(height: 60)
                                    .cornerRadius(7)
                                    .padding(.all, 5)
                                    Button(action: {
                                        activityStore.create(title: ActivityTitle, duration: Int(ActivityDuration) ?? 0, cost: Int(ActivityCost) ?? 0, location: ActivityLocation, categoryName: categories[CategoryIndex], details: ActivityDetails, image: categories[CategoryIndex])
                                    }) {
                                        Text("Add activity")
                                            .font(.title3)
                                            .foregroundColor(Color(red: 0.102, green: 0.369, blue: 0.388))
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 0.102, green: 0.369, blue: 0.388), lineWidth: 2)
                                            )
                                    }
                                    .padding()
                                Spacer()
                            }
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }

                case 1:
                    NavigationView {
                        HomeView(activities: activityStore.activities, categories: categories)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                            .environmentObject(AppState())
                    }.onAppear(perform: loadData)
                case 2:
                    NavigationView {
                        SearchView(activities: activityStore.activities, categories: categories)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                default:
                    NavigationView {
                        ProfileView(user: state.user)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .environmentObject(AppState())

                    }
                }
            }
            Divider()
                .padding(.bottom, 12)
            HStack {
                ForEach(0..<tabBarImageNames.count) { num in
                    VStack {
                        Button(action: {
                            selectedIndex = num
                        }, label: {
                            Spacer()
                            if num == 0 {
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
                        if num != 0 {
                            Text("\(tabBarNames[num])")
                                .font(.system(size: 12, weight: .light))
                        }
                    }

                }
            }
        }
    }

    func loadData() {
        if activityStore.activities.count == 0 {
            print("uploading data")
            // Food activities
            activityStore.create(title: "KAF Baking Class", duration: 90, cost: 40, location: "Norwich, VT", categoryName: "Food", details: "Learn how to make chocolate chip cookies and sourdough bread while getting to sample our newest pastry selection at the same time!", image: "cookies")
            activityStore.create(title: "Cabot Sampling", duration: 30, cost: 20, location: "Waitsfield, VT", categoryName: "Food", details: "Sample over 20 different varieties of our award winning cheese! Wine pairings are also avaiable", image: "Cheese")
            activityStore.create(title: "IC4U", duration: 15, cost: 5, location: "West Leb, NH", categoryName: "Food", details: "The best ice cream around - only avaiable during the summer. Be warned, lines can get out the door!", image: "Icecream")
            activityStore.create(title: "Four Aces", duration: 60, cost: 15, location: "West Leb, NH", categoryName: "Food", details: "Great diner food for a decent cost. We highly reccomend the pancakes and eggs benedict", image: "Diner")

            // Art Activities
            activityStore.create(title: "Hood Museum Tour", duration: 60, cost: 10, location: "Hanover, NH", categoryName: "Art", details: "Tour the latest collection at the Hood", image: "Museum")
            activityStore.create(title: "Jewelry Making", duration: 90, cost: 30, location: "Hanover, NH", categoryName: "Art", details: "Make Jewelry at The Hop with one of the art professors. Take home whatever you make!", image: "Jewelry")
            activityStore.create(title: "Ceramics", duration: 90, cost: 40, location: "Hanover, NH", categoryName: "Art", details: "Make ceramics at The Hop with one of the art professors. Take home whatever you make!", image: "Ceramics")
            activityStore.create(title: "deCordova Park", duration: 30, cost: 20, location: "Lincoln, MA", categoryName: "Art", details: "Visit the 30-acre sculpture park and contemporary art museum on the shore of Flint's Pond in Lincoln, Massachusetts, 20 miles northwest of Boston.", image: "Sculpture")

            // Fitness
            activityStore.create(title: "Mighty Yoga", duration: 40, cost: 15, location: "Hanover, NH", categoryName: "Fitness", details: "Find strength and flexibility through one of our classes", image: "Yoga")
            activityStore.create(title: "RVC Crossfit", duration: 60, cost: 15, location: "Lebanon, NH", categoryName: "Fitness", details: "Take one of our interactive, intense cross fit classes! Be prepared to get a sweat on", image: "Fit")
            activityStore.create(title: "Aquatics", duration: 45, cost: 5, location: "WRJ, NH", categoryName: "Fitness", details: "At Upper Valley Aquatics, use one of our lap pools to get some strokes in!", image: "Swim")
            activityStore.create(title: "Peloton 30 day trial", duration: 15, cost: 0, location: "", categoryName: "Fitness", details: "Get your fitness up with our free 30 day trial", image: "Bike")

            // Outdoors
            activityStore.create(title: "Gile", duration: 40, cost: 0, location: "Norwich, VT", categoryName: "Outdoors", details: "A quick hike for very rewarding views! Try to go in the fall for peak foliage.", image: "Fall")
            activityStore.create(title: "Cardigan", duration: 90, cost: 0, location: "Orange, VT", categoryName: "Outdoors", details: "Beautiful views of Vermont", image: "Hike")
            activityStore.create(title: "Ledyard Docs", duration: 20, cost: 5, location: "Hanover, NH", categoryName: "Outdoors", details: "Rent kayaks, canoes and paddle boards from the DOC and take a trip down the Conneticuit River", image: "River")
            activityStore.create(title: "Storrs Pond", duration: 90, cost: 5, location: "Hanover, NH", categoryName: "Outdoors", details: "Take a swim in the pond, pool or play some tennis on the outdoor courts", image: "Pond")

            // Education
            activityStore.create(title: "TEDxDartmouth", duration: 20, cost: 5, location: "Hanover, NH", categoryName: "Education", details: "Listen to one of our guest speakers give a TED talk", image: "TED")
            activityStore.create(title: "Rauner", duration: 30, cost: 0, location: "Hanover, NH", categoryName: "Education", details: "Visit Rauner Library, located at Dartmouth College, to take a look at the college archives.", image: "Education")
            activityStore.create(title: "Montshire", duration: 90, cost: 5, location: "Norwich, VT", categoryName: "Education", details: "The Montshire Museum of Science is a hands-on science museum located in Norwich, Vermont, United States.", image: "Science")
            activityStore.create(title: "History Society", duration: 20, cost: 5, location: "Concord, NH", categoryName: "Education", details: "Museum & library featuring exhibitions & resources devoted to New Hampshire history.", image: "History")

        }
    }
}
