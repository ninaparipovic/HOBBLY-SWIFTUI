//
//  ActivityDetail.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/4/21.
//

import SwiftUI

struct ActivityDetail: View {
    let activity: Activity
    var body: some View {
        Text(activity.title)
        Image(activity.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .navigationBarTitle(Text(activity.title), displayMode: .inline)
    }
}
