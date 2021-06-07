//
//  SearchView.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/11/21.
//

import SwiftUI

struct SearchView: View {
//    var item: Activity = testData[0].activities[0]

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Users, activities or interests")
                Spacer()
            }
            .padding(30)
            Text("People you may know")
            PeopleYouMayKnow()
                .padding(.bottom)
            Text("Trending")
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
            Text("Browse All")
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct PeopleYouMayKnow: View {
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: Text("Anna's Profile")) {
                VStack {
                    Image("UserDefaultImage")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    Text("Anna")
                    Text("Robertson")
                }
            }
            Spacer()
            NavigationLink(destination: Text("Anna's Profile")) {
                VStack {
                    Image("UserDefaultImage")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    Text("Anna")
                    Text("Robertson")
                }
            }
            Spacer()
            NavigationLink(destination: Text("Anna's Profile")) {
                VStack {
                    Image("UserDefaultImage")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    Text("Anna")
                    Text("Robertson")
                }
            }
            Spacer()
            NavigationLink(destination: Text("Anna's Profile")) {
                VStack {
                    Image("UserDefaultImage")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    Text("Anna")
                    Text("Robertson")
                }
            }
            Spacer()
        }
    }
}
