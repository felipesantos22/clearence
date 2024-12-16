//
//  CreatineViewModel.swift
//  creatine
//
//  Created by Felipe Santos on 15/12/24.
//

import SwiftUI
import SwiftData

final class CreatineViewModel: ObservableObject {
    @Published var creatine: [Creatinine] = []
    @Published var age: String = "" // Idade
    @Published var weight: String = "" // Peso
    @Published var creatinine: String = "" // Creatinina sérica
    @Published var sex: Sex = .feminino // Sexo
    @Published var clearanceResult: Double? = nil // Resultado do cálculo
    
    func calculateClearance(context:ModelContext) {
        // Validação e conversão de entradas
        guard let ageValue = Int(age),
              let weightValue = Double(weight),
              let creatinineValue = Double(creatinine),
              creatinineValue > 0 else {
            clearanceResult = nil // Limpa o resultado em caso de erro
            return
        }
        
        // Fator de ajuste para o sexo
        let k: Double = (sex == .masculino) ? 1.0 : 0.85
        
        // Fórmula de Cockcroft-Gault
        clearanceResult = ((140 - Double(ageValue)) * weightValue * k) / creatinineValue
        
        guard let result = clearanceResult else {
            print("Error: Resultado do clearance é nil")
            return
        }
        
        // Criar o objeto e inicializar com os valores calculados
        let saveResult = Creatinine(
            age: ageValue,
            weight: weightValue,
            creatine: creatinineValue,
            sex: sex,
            result: result,
            timestamp: Date()
        )
        
        // Inserir no contexto e salvar
        context.insert(saveResult)
        
        do {
            try context.save() // Salva o objeto no banco
            print("Result saved")
        } catch {
            print("Error saving result: \(error.localizedDescription)")
        }
        clearFields()
    }
    
    
    func clearFields() {
        self.age = ""
        self.weight = ""
        self.creatinine = ""
    }
    
    
    func clearAllResult(context: ModelContext) {
        for result in creatine {
            context.delete(result)
        }
        do {
            try context.save()
        } catch {
            print("Erro ao limpar resultado: \(error)")
        }
    }
    
    func clearResult(result: Creatinine, context: ModelContext) {
        context.delete(result)
        try? context.save()
    }
}
