//
//  SelectCurrency.swift
//  10-CurrencyConverterApp
//
//  Created by Emirhan İmrahor on 15.03.2025.
//

import SwiftUI
import Foundation

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with:")
                
                IconGrid(selectedCurrency: $topCurrency)
                
                Text("Select the currency you would like to convert to:")
                    .padding(.top)
                
                IconGrid(selectedCurrency: $bottomCurrency)
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.regular)
            }
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPiece
    @Previewable @State var bottomCurrency: Currency = .goldPiece
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
