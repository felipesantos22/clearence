//
//  TabView.swift
//  creatine
//
//  Created by Felipe Santos on 16/12/24.
//

import SwiftUI

struct TabViewStyle: View {
    var body: some View {
        TabView {
            Tab("ClCr", systemImage: "pill.fill") {
                CreatineView()
            }
//            .badge(2)
            
            
            Tab("Valores de referência", systemImage: "eye.fill") {
                ValuesReferenceView()
            }
            
            
//            Tab("Account", systemImage: "person.crop.circle.fill") {
//                LoginView()
//            }
//            .badge("!")
        }
    }
}

#Preview {
    TabViewStyle()
}
