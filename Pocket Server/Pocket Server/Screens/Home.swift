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
    @State private var isSheetActive : Bool = false

    /// The Connection the User tapped on.
    @State private var connection : Connection?

    /// The Default Storage Object for
    /// this View
    @ObservedObject private var storage : Storage = Storage.standard
    
    var body: some View {
        NavigationView {
            VStack {
                if storage.recentConnections.isEmpty {
                    Spacer()
                    Text("No recent Connections")
                    Spacer()
                } else {
                    List(storage.recentConnections) {
                        connection in
                        HStack {
                            Text(connection.name)
                            Spacer()
                        }
                        .background(.background)
                        .onTapGesture {
                            self.connection = connection
                        }
                        .sheet(item: $connection) {_ in
                            ConnectionDetail(connection: connection)
                        }
                    }
                }
            }.navigationTitle("Welcome")
                .navigationBarTitleDisplayMode(.automatic)
                .sheet(isPresented: $isSheetActive) {
                    CreateConnection()
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Create one") {
                            isSheetActive.toggle()
                        }
                    }
                    ToolbarItem(placement: .navigation) {
                        Button {
                            isSheetActive.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .primaryAction) {
                        EditButton()
                    }
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
