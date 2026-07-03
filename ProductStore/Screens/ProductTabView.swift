//
//  ProductTabView.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 02..
//

import SwiftUI

struct ProductTabView: View {
    @EnvironmentObject var order: Order

    var body: some View {
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
                .badge(order.items.count)
        }
    }
}

#Preview {
    ProductTabView()
        .environmentObject(Order())
}
