//
//  LoginView.swift
//  creatine
//
//  Created by Felipe Santos on 17/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var emailFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .padding(.bottom, 50)
            TextField("Email", text: $username)
                .keyboardType(.emailAddress)
                .frame(width: 200, height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 200, height: 1)
            
            SecureField("Password", text: $password)
                .keyboardType(.numberPad)
                .frame(width: 200, height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 200, height: 1)
        }
        .padding()
    }
}


#Preview {
    LoginView()
}
