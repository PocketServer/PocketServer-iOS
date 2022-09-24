//
//  Connection.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 18.09.22.
//

import Foundation

/// This struct represents a single connection
/// used and created by this App.
internal struct Connection : Identifiable {

    /// An ID to identify this Object.
    internal let id : UUID = UUID()

    /// The Name of this Connection
    internal let name : String

    /// The Password to this Servers Connection.
    internal let password : String

    /// The URL of this Connection
    internal let url : URL

    /// The Date the User last connected to the Server
    internal var lastConnected : Date

    /// Connects to the Server and
    /// returns if the connection was
    /// successful (true) or not (false)
    internal func connect() -> Bool {
        return false;
    }
}

// TODO: Remove
/// A Default Connection, that is not shown to
/// the User.
/// This is only used internal for Testing
internal let nilConnection : Connection = Connection(
    name: "Default Connection",
    password: "Password",
    url: URL(string: "github.com/Pocket-Server")!,
    lastConnected: Date()
)
