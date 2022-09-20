//
//  ConnectionDetails.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 18.09.22.
//

import SwiftUI

internal struct ConnectionDetail: View {

    internal let connection : Connection

    var body: some View {
        NavigationView {
            VStack {
                Text(connection.name)
                Text(connection.url.absoluteString)
            }.navigationTitle(connection.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {

                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done", role: .none) {

                        }
                    }
                }
        }
    }
}

struct ConnectionDetail_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionDetail(
            connection: Connection(name: "Test", url: URL(fileURLWithPath: ""))
            )
    }
}
