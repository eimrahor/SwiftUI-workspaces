//
//  IconGrid.swift
//  10-CurrencyConverterApp
//
//  Created by Emirhan İmrahor on 18.03.2025.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if self.selectedCurrency == currency {
                    CurrecyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrecyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.selectedCurrency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedCurrency: Currency = .goldPenny
    IconGrid(selectedCurrency: $selectedCurrency)
}
