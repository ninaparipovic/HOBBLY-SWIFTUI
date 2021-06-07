//
//  ProfileView.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import SwiftUI

struct ProfileView: View {
    var user: User?
    var body: some View {
        VStack {
            Image("UserDefaultImage")
                .resizable()
                .frame(width: 140.0, height: 140.0)
                .cornerRadius(70)
            Text(user?.name ?? "unknown")
                .font(.title)
            HStack {
                Image(systemName: "mappin")
                    .font(.system(size: 12.0))
                Text("Hanover, NH")
            }
            Text("Activate Search Mode")
            Text("My Interests")
                .font(.title)
            ScrollView(.horizontal) {
                HStack {
                    Spacer()
                    Image(systemName: "photo")
                        .font(.title)
                    Spacer()
                    Image(systemName: "photo")
                        .font(.title)
                    Spacer()
                    Image(systemName: "photo")
                        .font(.title)
                    Spacer()
                    Image(systemName: "photo")
                        .font(.title)
                    Spacer()
                }
            }
            Text("My Friends")
                .font(.title)
            ScrollView(.horizontal) {
                HStack {
                    Spacer()
                    Image(systemName: "photo")
                        .font(.title)
                    Spacer()
                    Image(systemName: "photo")
                        .font(.title)
                    Spacer()
                    Image(systemName: "photo")
                        .font(.title)
                    Spacer()
                    Image(systemName: "photo")
                        .font(.title)
                    Spacer()
                }
            }
            Spacer()
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
