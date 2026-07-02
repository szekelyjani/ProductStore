//
//  ProductCell.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 06. 29..
//

import SwiftUI

struct ProductCell: View {
    let product: Product

    var body: some View {
        HStack {
            ImageView(imageString: product.thumbnail)
                .frame(width: 100, height: 100)

            VStack(alignment: .leading) {
                Text(product.title)
                    .bold()
                Text(product.category.capitalized)

                HStack {
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    if product.discountPercentage > 0 {
                        Text("\(product.discountPercentage, specifier: "%.0f")% off")
                            .font(.caption2)
                            .foregroundStyle(.green)
                    }
                }
            }

            Spacer()

            HStack(spacing: 2) {
                Image(systemName: "star.fill")
                    .font(.caption2)
                    .foregroundStyle(.yellow)
                Text("\(product.rating, specifier: "%.1f")")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    List {
        ProductCell(product: Product.example)
    }
}
