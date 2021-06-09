//
//  MinutesSelector.swift
//  Hobbly
//
//  Created by Nina Paripovic on 5/24/21.
//

import SwiftUI

struct MinutesSelector: View {
    @Binding var timeSelection: Int
    let numbers: [Int]

    var body: some View {
        ZStack {
            Color(red: 0.102, green: 0.369, blue: 0.388)
            VStack {
                HStack {
                        Text("I HAVE")
                                Picker("Number", selection: $timeSelection) {
                                               ForEach(0..<numbers.count) { index in
                                                   Text("\(self.numbers[index])")
                                                    .foregroundColor(Color.white)
                                               }
                    //            Button {
                    //                print("Button tapped")
                    //            } label: {
                    //                Text("Welcome")
                    //                    .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                    //                    .font(.largeTitle)
                    //            }
                                }
                                .frame(width: 50, height: 70)
                                .clipped()

                        Text("MINUTES")
                }
                .foregroundColor(Color.white)
                Spacer()
            }

        }

}
}
//struct MinutesSelector_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MinutesSelector()
//        }
//    }
//}
