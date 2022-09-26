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


    /// Dismiss Function to dismiss Sheet.
    @Environment(\.dismiss) private var dismiss

    /// The Name of the new Connection
    @State private var name : String = ""

    /// The URL to that new Connection.
    @State private var urlString : String = ""

    /// The password for the new Connection.
    @State private var password : String = ""

    /// A closer and more detailed Description to this Connection
    @State private var description : String = ""

    /// Wether the Alert Dialog is presented or not.
    @State private var alertPresented : Bool = false

    var body: some View {
        NavigationView {
            List {
                Section("Required") {
                    TextField("Name", text: $name)
                        .textInputAutocapitalization(.words)

                    TextField("URL", text: $urlString)
                        .textInputAutocapitalization(.never)

                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.words)
                }
                Section("Optional") {
                    TextField("Description", text: $description)
                        .textInputAutocapitalization(.sentences)
                }
            }.navigationTitle("Create Connection")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            if check() {
                                Storage.standard.recentConnections.append(
                                    Connection(
                                        name: name,
                                        description: description,
                                        password: password , url: URL(string: urlString), lastConnected: Date.now
                                    ))
                                dismiss()
                            } else {
                                alertPresented = true
                            }

                        }
                    }
                }
                .interactiveDismissDisabled(false)
                .alert("Empty Fields",
                       isPresented: $alertPresented) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("Not all required fields are filled in.")
                }
        }
    }

    /// Checks if all required variables
    /// are set and returns true if so. Otherwise false
    /// is returned.
    private func check() -> Bool {
        return !name.isEmpty && !urlString.isEmpty && !password.isEmpty
    }
}

struct CreateConnection_Previews: PreviewProvider {
    static var previews: some View {
        CreateConnection( )
    }
}
