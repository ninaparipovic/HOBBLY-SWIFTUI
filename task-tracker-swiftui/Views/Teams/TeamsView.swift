//
//  TeamsView.swift
//  task-tracker-swiftui
//
//  Created by Andrew Morgan on 03/11/2020.
//

// TODO: Propose a way to remove the need for these Realm functions to work with the data

import SwiftUI
import RealmSwift

struct TeamsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var state: AppState

    @State var members: [Member] = []
    @State var showingAddTeamMember = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(members) { member in
                        LabeledText(label: member.id, text: member.name)
                    }
                    .onDelete(perform: removeTeamMember)
                }
                Spacer()
            }
            .navigationBarTitle(Text("My Team"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(
                    action: { self.presentationMode.wrappedValue.dismiss() }) { Image(systemName: "xmark.circle") },
                trailing: Button(action: { self.showingAddTeamMember = true }) { Image(systemName: "plus.circle.fill")
                    .renderingMode(.original)
                }
            )
        }
        .sheet(isPresented: $showingAddTeamMember) {
            AddTeamMemberView(refresh: fetchTeamMembers)
                .environmentObject(state)
        }
        .onAppear(perform: fetchTeamMembers)
    }

    func fetchTeamMembers() {
        state.shouldIndicateActivity = true
        let user = app.currentUser!

        user.functions.getMyTeamMembers([]) { (result, error) in
            DispatchQueue.main.sync {
                state.shouldIndicateActivity = false
                guard error == nil else {
                    state.error = "Fetch team members failed: \(error!.localizedDescription)"
                    return
                }
                guard let result = result else {
                    state.error = "Result from fetching members is nil"
                    return
                }
                self.members = result.arrayValue!.map({ (bson) in
                    return Member(document: bson!.documentValue!)
                })
            }
        }
    }

    func removeTeamMember(at offsets: IndexSet) {
        state.shouldIndicateActivity = true
        let user = app.currentUser!
        let email = members[offsets.first!].name
        user.functions.removeTeamMember([AnyBSON(email)]) { (result, error) in
            DispatchQueue.main.sync {
                state.shouldIndicateActivity = false
                if let error = error {
                    self.state.error = "Internal error, failed to remove member: \(error.localizedDescription)"
                } else if let resultDocument = result?.documentValue {
                    if let resultError = resultDocument["error"]??.stringValue {
                        self.state.error = resultError
                    } else {
                        print("Removed team member")
                        self.fetchTeamMembers()
                    }
                } else {
                    self.state.error = "Unexpected result returned from server"
                }
            }
        }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Preview not available as view relies on calling Realm functions")
    }
}
