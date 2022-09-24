//
//  ListElement.swift
//  Pocket Server
//
//  Created by Julian Schumacher on 24.09.22.
//

import SwiftUI

struct ListElement: View {

    private let name : String

    private let value : Any

    private let obscure : Bool

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
                    Text("**********")
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
            name: "Name", value: "Value")
    }
}
