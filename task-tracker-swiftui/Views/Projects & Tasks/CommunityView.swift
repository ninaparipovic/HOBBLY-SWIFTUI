//
//  CommunityView.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/11/21.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("PENDING ACTIVITIES")
                .padding(.leading, 20)
                .padding(.top)
            List {
                HStack {
                    Text("Sent    ")
                        .font(.system(size: 26, weight: .bold))
                    Text("Recieved")
                        .font(.system(size: 26, weight: .regular))
                }
                HStack {
                    Image("cookies")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                    Spacer()
                    Text("You invited Anna G. to the Hood")
                }
                HStack {
                    Image("cookies")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                    Spacer()
                    Text("You invited Anna G. to the Hood")
                }
                HStack {
                    Image("cookies")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                    Spacer()
                    Text("You invited Anna G. to the Hood")
                }

            Text("Friend's looking to do something")
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
            Spacer()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommunityView()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
