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
//                        .foregroundColor(.white)
                        .font(.title)
                }
            }
        }

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
//                Color(.white)
                Image(activity.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    btnBack
            }
            GeometryReader { _ in
                ZStack(alignment: .topLeading) {
                    HStack {
                        Text(activity.title)
                            .font(Font.custom("Futura", size: 28))
                            .foregroundColor(Color(red: 0.102, green: 0.369, blue: 0.388))
                    }
                    .padding()
                }
            }
            .frame(height: 50)
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Details")
                            Text("$\(activity.cost) per person")
                        }
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "mappin")
                                Text(activity.location)
                            }
                            Spacer()
                        }
                    }.padding()
                    Spacer()
                }
Spacer()
        }

            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationBarTitle("")
    }

}
