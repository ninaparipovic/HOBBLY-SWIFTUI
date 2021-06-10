//
//  CaptionLabel.swift
//  task-tracker-swiftui
//
//

import SwiftUI

struct CaptionLabel: View {
    var title: String

    var body: some View {
        HStack {
            Text(LocalizedStringKey(title))
                .font(.title3)
                .lineLimit(5)
                .multilineTextAlignment(.leading)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct CaptionLabel_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(
            CaptionLabel(title: "Title")
                .previewLayout(.sizeThatFits)
                .padding()
        )
    }
}
