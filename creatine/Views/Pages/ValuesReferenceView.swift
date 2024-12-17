//
//  ValuesReferenceView.swift
//  creatine
//
//  Created by Felipe Santos on 17/12/24.
//

import SwiftUI

struct ValuesReferenceView: View {
    
    @StateObject private var viewModel = CreatineViewModel()
    
    
    var body: some View {
        ZStack {
            Text("Valores de Referência")
            if viewModel.isLoading {
                ZStack {
                    Color(.systemBackground)
                        .edgesIgnoringSafeArea(.all)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(2)
                }
            }
        }
        .onAppear {
            viewModel.startApp()
        }
    }
}

#Preview {
    ValuesReferenceView()
}
