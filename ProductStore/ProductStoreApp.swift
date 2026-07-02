//
//  ProductStoreApp.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 06. 29..
//

import SwiftUI

@main
struct ProductStoreApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ProductListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                AccountView()
                    .tabItem {
                        Label("Account", systemImage: "person")
                    }

                OrderView()
                    .tabItem {
                        Label("Order", systemImage: "bag")
                    }
            }
        }
    }
}
