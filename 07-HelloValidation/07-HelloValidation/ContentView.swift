//
//  ContentView.swift
//  07-HelloValidation
//
//  Created by Emirhan İmrahor on 4.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginFormError = LoginFormError()
    
    private func clearForm() {
        loginFormError = LoginFormError()
    }
    
    var isFormValid : Bool {
        clearForm()
        
        if email.isEmpty {
            loginFormError.email = "Email is required"
        } else if !email.isValidEmail {
            loginFormError.email = "Invalid email format"
        }
        
        if password.isEmpty {
            loginFormError.password = "Password is required"
        }
        
        return loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Email", text: $email)
                if !loginFormError.email.isEmpty {
                    Text(loginFormError.email)
                        .font(.caption)
                }
                SecureField("Password", text: $password)
                if(!loginFormError.password.isEmpty) {
                    Text(loginFormError.password)
                        .font(.caption)
                }
                Button("Login") {
                    if isFormValid {
                        
                    }
                }//.disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    ContentView()
}
