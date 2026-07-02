//
//  XDismissButton.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 02..
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.secondary)
                .opacity(0.6)

            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    XDismissButton()
}
