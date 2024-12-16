//
//  Creatinine.swift
//  creatine
//
//  Created by Felipe Santos on 15/12/24.
//

import Foundation
import SwiftData

@Model
class Creatinine {
    var id: UUID
    var age: Int
    var weight: Double
    var creatine: Double
    var sex: Sex
    var result: Double
    var timestamp: Date
    
    init(age: Int, weight: Double, creatine: Double, sex: Sex, result: Double, timestamp: Date) {
        self.id = UUID()
        self.age = age
        self.weight = weight
        self.creatine = creatine
        self.sex = sex
        self.result = result
        self.timestamp = timestamp
    }
}
