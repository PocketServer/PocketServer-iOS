//
//  Storage.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 18.09.22.
//

import Foundation


/// This struct handles all the
/// Internaction done with the File System.
internal class Storage : ObservableObject {

    init(userDefaults : UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    /// Where the class should store and where form it
    /// should load all the Data
    private let userDefaults : UserDefaults

    /// The Standard Storage Place
    internal static let standard : Storage = Storage()

    /// The Storage Place
    internal static let secret : Storage = Storage(
        userDefaults: UserDefaults(suiteName: "") ?? UserDefaults.standard)

    /// The List of all Connections used in this App.
    @Published internal var allConnections : [Connection] = []

    /// A list of all the recent Connections.
    @Published internal var recentConnections : [Connection] = []

    /// Loads all the Data from the File System.
    internal func load() -> Void {
    }

    /// Stores all the Data to the File System.
    internal func store() -> Void {
    }
}
