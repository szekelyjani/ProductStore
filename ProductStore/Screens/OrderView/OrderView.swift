//
//  OrderView.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 02..
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            ZStack {
                if order.items.isEmpty {
                    EmptyState(imageName: "list.clipboard",
                               message: "You have no items in your order. \nPlease add an item.")
                } else {
                    VStack {
                        List {
                            ForEach(order.items) { product in
                                ProductCell(product: product)
                            }
                            .onDelete(perform: order.deleteItems)
                        }
                        .listStyle(.plain)

                        Button {
                            print("Order placed")
                        } label: {
                            Label("$\(order.totalPrice, specifier: "%.2f") Place Order", systemImage: "cart.badge.plus")
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    }
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
