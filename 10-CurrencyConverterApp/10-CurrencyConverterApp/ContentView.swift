//
//  ContentView.swift
//  10-CurrencyConverterApp
//
//  Created by Emirhan İmrahor on 14.03.2025.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    private static let defaultLeftCurrency: Currency = .silverPiece
    private static let defaultRightCurrency: Currency = .goldPiece
    
    @State private var leftCurrency: Currency = {
        let rawValue = UserDefaults.standard.double(forKey: "leftCurrency")
        return Currency(rawValue: rawValue) ?? ContentView.defaultLeftCurrency
    }()
    
    @State private var rightCurrency: Currency = {
        let rawValue = UserDefaults.standard.double(forKey: "rightCurrency")
        return Currency(rawValue: rawValue) ?? ContentView.defaultRightCurrency
    }()
    
    
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack {
                    VStack {
                        CurrencyAmountView(currency: $leftCurrency, amount: $leftAmount, showSelectCurrency: $showSelectCurrency, typing: _leftTyping)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        CurrencyAmountView(currency: $rightCurrency, amount: $rightAmount, showSelectCurrency: $showSelectCurrency, isRightAmount: true, typing: _rightTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing,20)
                }
                
                
            }//.border(.blue)
        }
        .onTapGesture {
            dismissKeyboard()
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert( leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            UserDefaults.standard.set(leftCurrency.rawValue, forKey: "leftCurrency")
            UserDefaults.standard.synchronize()
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            UserDefaults.standard.set(rightCurrency.rawValue, forKey: "rightCurrency")
            UserDefaults.standard.synchronize()
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
