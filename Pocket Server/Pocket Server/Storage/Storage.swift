//
//  Storage.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 18.09.22.
//

import Foundation


/// This struct handles all the
/// internaction done with the File System.
internal struct Storage {

    /// The List of all Connections used in this App.
    internal static var allConnections : [Connection] = []

    /// A list of all the recent Connections.
    internal static var recentConnections : [Connection] = []

    /// The Default Storage this App is using to store all of it's Data.
    private static let userDefaults : UserDefaults = UserDefaults.standard

    /// Loads all the Data from the File System.
    internal static func load() -> Void {
    }

    /// Stores all the Data to the File System.
    internal static func store() -> Void {
    }
}
