//
//  ConnectionDetails.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 18.09.22.
//

import SwiftUI

internal struct ConnectionDetail: View {

    /// The Connection this Screen
    /// represents
    internal var connection : Connection

    /// DIsmiss Function for this Sheet.
    @Environment(\.dismiss) private var dismissSheet

    init(connection: Connection) {
        self.connection = connection
    }



    var body: some View {
        NavigationView {
            VStack {
                List {
                    ListElement(name: "Name", value: connection.name)
                    ListElement(name: "URL", value: connection.url?.absoluteString ?? "")
                    ListElement(name: "Password", value: connection.password, obscure: true)
                    ListElement(name: "Date", value:
                                    Text(connection.lastConnected, style: .date))
                }
            }.navigationTitle(connection.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            dismissSheet()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done", role: .none) {
                            dismissSheet()
                        }
                    }
                }
        }
    }
}

struct ConnectionDetail_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionDetail(connection: nilConnection)
    }
}
