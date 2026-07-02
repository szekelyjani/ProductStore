//
//  ImageView.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 01..
//

import SwiftUI

struct ImageView: View {
    let imageString: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageString)) { phase in
            switch phase {
            case .empty:
                Color.gray
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(_):
                Color.gray
            @unknown default:
                fatalError()
            }
        }
    }
}

#Preview {
    ImageView(imageString: Product.example.thumbnail)
}
