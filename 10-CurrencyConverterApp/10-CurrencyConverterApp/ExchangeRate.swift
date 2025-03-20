//
//  ExtractedView.swift
//  10-CurrencyConverterApp
//
//  Created by Emirhan İmrahor on 15.03.2025.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text: String
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, text: "asd")
}
