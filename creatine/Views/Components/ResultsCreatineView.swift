//
//  ResultsCreatineView.swift
//  creatine
//
//  Created by Felipe Santos on 14/12/24.
//

import SwiftUI
import SwiftData

struct ResultsCreatineView: View {
    
    @Query(sort: \Creatinine.timestamp, order: .forward) private var results: [Creatinine]
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = CreatineViewModel()

    var body: some View {
        VStack {
            Text("Resultados")
                .font(.title)
                .padding()
            
            if results.isEmpty {
                Text("Nenhum resultado salvo.")
                    .foregroundColor(.gray)
            } else {
                List(results) { result in
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Idade: \(result.age) anos")
                        Text("Peso: \(String(format: "%.2f", result.weight)) kg")
                        Text("Creatinina: \(String(format: "%.2f", result.creatine)) mg/dL")
                        Text("Sexo: \(result.sex.rawValue.capitalized)")
                        Text("Resultado: \(String(format: "%.2f", result.result)) mL/min")
                        Text("Data: \(result.timestamp, formatter: dateFormatter)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        // Excluindo o item
                        Button(action: {
                            viewModel.clearResult(result: result, context: context)
                        }){
                            Text("Excluir").foregroundColor(.red)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}



#Preview {
    ResultsCreatineView()
}
