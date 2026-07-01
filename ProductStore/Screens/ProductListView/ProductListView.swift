//
//  ProductListView.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 06. 29..
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var productStore = ProductStore()

    var body: some View {
        NavigationView {
            List {
                ForEach(productStore.products) { product in
                    ProductCell(product: product)
                }
            }
            .navigationTitle("Products")
            .overlay {
                if let error = productStore.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.title)
                        .background(.thinMaterial)
                        .cornerRadius(5)
                }
            }
        }
        .task {
            await productStore.getProducts()
        }
    }
}

#Preview {
    ProductListView()
}
