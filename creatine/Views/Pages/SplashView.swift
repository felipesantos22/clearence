//
//  SplashView.swift
//  creatine
//
//  Created by Felipe Santos on 19/12/24.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                TabViewStyle()
            }else {
                Color.black.ignoresSafeArea(.all)
                Image(systemName: "pill").foregroundColor(.white)
                    .frame(width: 100, height: 100)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: 0.1)) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
