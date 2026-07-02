//
//  ProductListView.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 06. 29..
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var productStore = ProductStore()
    @State private var isShowingDetail = false
    @State private var selectedProduct: Product?

    var body: some View {
        NavigationView {
            List(productStore.products) { product in
                ProductCell(product: product)
                    .onTapGesture {
                        selectedProduct = product
                        isShowingDetail = true
                    }
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            .navigationTitle("Products")
            .disabled(isShowingDetail)
            .overlay {
                if let error = productStore.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.title)
                        .background(.thinMaterial)
                        .cornerRadius(5)
                }
                if isShowingDetail {
                    if let selectedProduct {
                        ProductDetailView(product: selectedProduct,
                                          isShowingDetail: $isShowingDetail)
                    }
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
