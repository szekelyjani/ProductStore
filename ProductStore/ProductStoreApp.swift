//
//  ProductStoreApp.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 06. 29..
//

import SwiftUI

@main
struct ProductStoreApp: App {
    var order = Order()

    var body: some Scene {
        WindowGroup {
            ProductTabView()
                .environmentObject(order)
        }
    }
}
