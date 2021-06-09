//
//  ActivityDetail.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import SwiftUI

struct ActivityDetail: View {
    let activity: Activity
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
//                Image() // set image here
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.white)
                    Image(systemName: "arrow.backward.circle.fill")
                        .foregroundColor(.white)
                }
            }
        }

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Color(red: 0.102, green: 0.369, blue: 0.388)
                Image(activity.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(7)
                btnBack
            }
            HStack {
                Text(activity.title)
                Spacer()
            }

        }

            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
//            .navigationBarItems(leading: btnBack)
    }

}
