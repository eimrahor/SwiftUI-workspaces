//
//  CurrencyAmountView.swift
//  10-CurrencyConverterApp
//
//  Created by Emirhan İmrahor on 20.03.2025.
//

import SwiftUI

struct CurrencyAmountView: View {
    @Binding var currency: Currency
    @Binding var amount: String
    @Binding var showSelectCurrency: Bool
    @State var isRightAmount: Bool = false
    @FocusState var typing
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        HStack {
            Image(currency.image)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(currency.name)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .onTapGesture {
            showSelectCurrency.toggle()
            currencyTip.invalidate(reason: .actionPerformed)
        }
        .popoverTip(currencyTip, arrowEdge: .bottom)
        
        if isRightAmount {
            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .focused($typing)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
        } else {
            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .focused($typing)
                .keyboardType(.numberPad)
        }
    }
}
