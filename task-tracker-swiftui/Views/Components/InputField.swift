//
//  InputField.swift
//  task-tracker-swiftui
//
//

import SwiftUI

struct InputField: View {
    @State var title: String
    @Binding private(set) var text: String
    @EnvironmentObject var state: AppState

    var showingSecureField = false

    private enum Dimensions {
        static let noSpacing: CGFloat = 0
        static let bottomPadding: CGFloat = 16
        static let iconSize: CGFloat = 20
    }

    var body: some View {
        VStack(spacing: Dimensions.noSpacing) {
            CaptionLabel(title: title)
                .padding(.leading, 5)
            HStack(spacing: Dimensions.noSpacing) {
                if !showingSecureField {
                    TextField("", text: $text)
                        .padding(.all, 5)
                        .background(Color(red: 0.102, green: 0.369, blue: 0.388))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.body)
                } else {
                    SecureField("", text: $text)
                        .padding(.all, 5)
                        .background(Color(red: 0.102, green: 0.369, blue: 0.388))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.body)
                }
            }
        }
    }
}

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(
            Group {
                InputField(title: "Input", text: .constant("Data"))
                InputField(title: "Input secure", text: .constant("Data"), showingSecureField: true)
            }
            .previewLayout(.sizeThatFits)
            .padding()
        )
    }
}
