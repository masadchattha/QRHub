//
//  Alert.swift
//  QRHub
//
//  Created by Muhammad Asad Chattha on 09/12/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: String
    let message: String
    let action: (() -> Void)?
}


extension View {
    func presentAlert(item: Binding<AlertItem?>) -> some View {
        alert(item: item) { item in
            Alert(
                title: Text(item.title),
                message: Text(item.message),
                primaryButton: .default(Text("OK"), action: {
                    item.action?()
                }),
                secondaryButton: .cancel()
            )
        }
    }
}
