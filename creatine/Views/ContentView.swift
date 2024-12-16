//
//  ContentView.swift
//  creatine
//
//  Created by Felipe Santos on 13/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            CreatineView()
        }
    }
}

#Preview {
    ContentView()
}


//private func deleteItems(offsets: IndexSet) {
//    withAnimation {
//        for index in offsets {
//            modelContext.delete(items[index])
//        }
//    }
//}
