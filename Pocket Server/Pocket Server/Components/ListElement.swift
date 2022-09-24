//
//  ListElement.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 24.09.22.
//

import SwiftUI

/// A single Element in a List.
/// Mostly used to display Conenction Details.
///
struct ListElement: View {

    /// The Name of this Detail.
    private let name : String

    /// The Value of
    /// this Element
    private let value : Any

    /// Whether to obscure the
    /// Text or not.
    /// Only available
    /// if the value is a Text
    private let obscure : Bool

    @State private var passwordShown : Bool = false

    init(name: String, value: Text) {
        self.name = name
        self.value = value
        obscure = false
    }

    init(name: String, value: String, obscure: Bool = false) {
        self.name = name
        self.value = value
        self.obscure = obscure
    }

    var body: some View {
        HStack {
            Text(name)
            Spacer()
            if value is String {
                if obscure {
                    Menu(passwordShown ? value as! String : "**********") {
                        Button {
                            passwordShown.toggle()
                        } label: {
                            if passwordShown {
                                Text("Hide Passwort")
                            } else {
                                Text("Show Password")
                            }
                        }
                        Button("Copy") {
                            UIPasteboard.general.string = value as? String
                        }
                    }.foregroundColor(.primary)
                } else {
                    Text(value as! String)
                }
            } else {
                value as! Text
            }
        }
    }
}

struct ListElement_Previews: PreviewProvider {
    static var previews: some View {
        ListElement(
            name: "Name", value: "Value", obscure: true)
    }
}
