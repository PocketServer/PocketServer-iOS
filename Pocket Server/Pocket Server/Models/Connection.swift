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

    init(name : String, description : String = "", password : String, url : URL?, lastConnected : Date) {
        self.name = name
        self.description = description
        self.password = password
        self.url = url
        self.lastConnected = lastConnected
    }

    /// An ID to identify this Object.
    internal let id : UUID = UUID()

    /// The Name of this Connection
    internal let name : String

    /// A closer and more detailed Description to this Connection
    internal var description : String = ""

    /// The Password to this Servers Connection.
    internal let password : String

    /// The URL of this Connection
    internal let url : URL?

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
    description: "This is a very long description. I don't know what to type, but it is a lot of text",
    password: "Password",
    url: URL(string: "github.com/Pocket-Server")!,
    lastConnected: Date()
)
