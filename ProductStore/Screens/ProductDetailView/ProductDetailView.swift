//
//  ProductDetailView.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 01..
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var order: Order
    let product: Product
    @Binding var isShowingDetail: Bool

    var body: some View {
        VStack {
            ImageView(imageString: product.images.first ?? product.thumbnail)
                .frame(width: 300, height: 225)

            VStack(spacing: 10) {
                Text(product.title)
                    .font(.title)

                Text(product.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .minimumScaleFactor(0.7)
                    .padding()
            }

            Button {
                order.add(product)
                isShowingDetail = false
            } label: {
                Label("$\(product.price, specifier: "%.2f") - Add to Cart", systemImage: "cart.badge.plus")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.bottom)
        }
        .frame(width: 300, height: 525)
        .background(.background)
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetail = false
            } label: {
                XDismissButton()
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    ProductDetailView(product: Product.example, isShowingDetail: .constant(false))
}
