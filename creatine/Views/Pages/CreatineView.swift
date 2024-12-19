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
            // Fundo branco em toda a tela
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                // Título
                Text("Clearance de Creatinina")
                    .foregroundColor(.black)
                    .bold()
                    .font(.system(size: 26))
                    .padding(.top, 20)
                
                // Campos de entrada
                VStack(spacing: 20) {
                    // Idade
                    VStack {
                        TextField("Idade (anos):", text: $viewModel.age)
                            .keyboardType(.numberPad)
                            .frame(width: 200, height: 50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 200, height: 1)
                    }
                    
                    // Peso
                    VStack {
                        TextField("Peso (Kg):", text: $viewModel.weight)
                            .keyboardType(.decimalPad)
                            .frame(width: 200, height: 50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 200, height: 1)
                    }
                    
                    // Creatinina
                    VStack {
                        TextField("Creatinina sérica (mg/dL):", text: $viewModel.creatinine)
                            .keyboardType(.decimalPad)
                            .frame(width: 200, height: 50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 200, height: 1)
                    }
                    
                    // Sexo
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
                
                // Botões e Resultado
                VStack(spacing: 20) {
                    // Botão para calcular
                    Button(action: {
                        viewModel.calculateClearance(context: context)
                    }) {
                        Text("Calcular")
                            .font(.callout)
                            .frame(width: 200, height: 50)
                            .background(.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(25)
                    }
                    
                    // Resultado
                    if let result = viewModel.clearanceResult {
                        Text("Resultado: \(String(format: "%.2f", result)) mL/min")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .onAppear {
                                viewModel.clearResultsAfterSave()
                            }
                    }
                
                    NavigationLink(destination: ResultsCreatineView()) {
                        Text("Ver Resultados")
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 30)
                }
            }
            
            // Carregamento
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
    CreatineView()
}
