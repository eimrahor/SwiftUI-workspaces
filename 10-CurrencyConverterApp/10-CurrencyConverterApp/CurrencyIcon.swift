//
//  CurrencyIcon.swift
//  10-CurrencyConverterApp
//
//  Created by Emirhan İmrahor on 15.03.2025.
//

import SwiftUI

struct CurrecyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown).opacity(0.75)
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrecyIcon(currencyImage: .goldpenny, currencyName: "asdf")
}
