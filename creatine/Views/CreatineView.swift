//
//  CreatineView.swift
//  creatine
//
//  Created by Felipe Santos on 14/12/24.
//

import SwiftUI
import SwiftData

struct CreatineView: View {
    
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = CreatineViewModel()
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Clearance de Creatinina")
                    .foregroundColor(.black)
                    .bold()
                    .font(.system(size: 26))
                
                VStack(spacing: 20) {
                    VStack {
                        TextField("Idade (anos):", text: $viewModel.age)
                            .keyboardType(.numberPad)
                            .frame(width: 200, height: 50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 200, height: 1)
                    }
                    
                    VStack {
                        TextField("Peso (Kg):", text: $viewModel.weight)
                            .keyboardType(.decimalPad)
                            .frame(width: 200, height: 50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 200, height: 1)
                    }
                    
                    VStack {
                        TextField("Creatinina sérica (mg/dL):", text: $viewModel.creatinine)
                            .keyboardType(.decimalPad)
                            .frame(width: 200, height: 50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 200, height: 1)
                    }
                    
                    VStack {
                        Picker("Sexo", selection: $viewModel.sex) {
                            ForEach(Sex.allCases, id: \.self) { sex in
                                Text(sex.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 250)
                    }
                }
                .padding()
                
                VStack(spacing: 20) {
                    Button(action: {viewModel.calculateClearance(context:context)}) {
                        Text("Calcular")
                            .font(.callout)
                            .frame(width: 200, height: 50)
                            .background(.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(25)
                    }
                    
                    if let result = viewModel.clearanceResult {
                        Text("Resultado: \(String(format: "%.2f", result)) mL/min")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    
                    NavigationLink(destination: ResultsCreatineView()) {
                        Text("Ver Resultados")
                            .font(.callout)
                            .bold()
                    }
                    .padding(.top, 30)
                }
            }
        }
    }
}

#Preview {
    CreatineView()
}
