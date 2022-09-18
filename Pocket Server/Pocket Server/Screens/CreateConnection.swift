//
//  CreateConnection.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 18.09.22.
//

import SwiftUI

/// The View to create and add a new Connection
/// to the App.
struct CreateConnection: View {

    @Environment(\.dismiss) var dismissSheet

    /// The Name of the new Connection
    @State private var name : String = ""

    /// The URL to that new Connection.
    @State private var url : String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Name")
                TextField(
                    "Name", text: $name)

                Text("Name")
                TextField(
                    "URL", text: $url)
            }.navigationTitle("Create Connection")
                .navigationBarTitleDisplayMode(.inline)
                .padding(20)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismissSheet()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            dismissSheet()
                        }
                    }
                }
                .interactiveDismissDisabled(true)
        }
    }
}

struct CreateConnection_Previews: PreviewProvider {
    static var previews: some View {
        CreateConnection()
    }
}
