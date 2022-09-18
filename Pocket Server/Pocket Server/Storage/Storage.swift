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

    internal static let allConnections : [Connection] = []

    /// A list of all the recent Connections.
    internal static let recentConnections : [Connection] = []

    /// Loads all the Data from the File System.
    internal static func load() -> Void {
    }

    /// Stores all the Data to the File System.
    internal static func store() -> Void {
    }
}
