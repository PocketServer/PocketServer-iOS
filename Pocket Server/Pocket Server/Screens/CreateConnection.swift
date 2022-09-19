//
//  CreateConnection.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 18.09.22.
//

import SwiftUI

/// The View to create and add a new Connection
/// to the App.
internal struct CreateConnection: View {

    /// The Environment Variable to dismiss
    /// this View as a Sheet.
    @Environment(\.dismiss) private var dismissSheet

    /// The Name of the new Connection
    @State private var name : String = ""

    /// The URL to that new Connection.
    @State private var url : String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Name")
                TextField("Name", text: $name)
                    .textInputAutocapitalization(.words)

                Text("URL")
                TextField("URL", text: $url)
                    .textInputAutocapitalization(.never)

            }.navigationTitle("Create Connection")
                .navigationBarTitleDisplayMode(.inline)
                .padding(20)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            dismissSheet()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            dismissSheet()
                        }
                    }
                }
                .textFieldStyle(.roundedBorder)
                .interactiveDismissDisabled(true)
        }
    }
}

struct CreateConnection_Previews: PreviewProvider {
    static var previews: some View {
        CreateConnection()
    }
}
