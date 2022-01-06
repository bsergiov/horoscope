//
//  SignModel.swift
//  horoscope
//
//  Created by BSergio on 06.01.2022.
//

import Foundation

// MARK: - SignModel
struct SignModel {
    
    let sign: String
    let shortDescription: String
    let longDescription: String
    let signImg: String
    
    static func getSigns() -> [SignModel] {
        var signs: [SignModel] = []
        // здесь логика по наполнению массива
        return signs
    }
}
