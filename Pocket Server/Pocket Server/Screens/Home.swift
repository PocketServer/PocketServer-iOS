//
//  Home.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 18.09.22.
//

import SwiftUI

/// The Home Screen of this App.
/// This View is shown when the User opens up
/// the App.
internal struct Home: View {
    /// The Variable that determines whether the
    /// Sheet is active or not.
    @State private var isSheetActive = false

    var body: some View {
        NavigationView {
            VStack {
                if(Storage.recentConnections.isEmpty) {
                    Spacer()
                    Text("No recent Connections")
                    Spacer()
                    Button("Create one") {
                        isSheetActive = true
                    }
                } else {
                    ForEach(Storage.recentConnections) { connection in
                        Text(connection.name)
                    }
                }
            }.navigationTitle("Welcome")
                .navigationBarTitleDisplayMode(.automatic)
                .sheet(isPresented: $isSheetActive) {
                    CreateConnection()
                }

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
