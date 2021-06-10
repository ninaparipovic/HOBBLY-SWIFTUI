//
//  ProfileView.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import SwiftUI

struct ProfileView: View {
    var user: User?
    @EnvironmentObject var state: AppState
    @State var image: Image?

    @State var showImagePicker = false
    @State private var inputImage: UIImage?
    let dynamicScale = 1.2
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .fill(Color(red: 0.102, green: 0.369, blue: 0.388))
                    .frame(width: 200, height: 200)
                if state.image != nil {
                    state.image?
                        .resizable()
                        .frame(width: 200, height: 200)
                                        .clipped()
                                        .clipShape(Circle())
                } else {
                    VStack {
                        Text("Tap to add")
                        Text("profile image")
                    }
                    .font(Font.custom("Futura", size: 20))
                        .foregroundColor(.white)
                }
            }
            .onTapGesture {
                self.showImagePicker = true
            }
            Text(state.user?.name ?? "unknown")
                .font(Font.custom("Futura", size: 30))
            HStack {
                Image(systemName: "mappin")
                    .font(.system(size: 12.0))
                Text("Hanover, NH")
                    .font(Font.custom("Futura", size: 20))
            }
            Spacer()

        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        state.image = image
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
