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

    /// The URL of this Connection
    internal let url : URL
}
