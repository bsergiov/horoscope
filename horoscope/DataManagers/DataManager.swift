//
//  DataManager.swift
//  horoscope
//
//  Created by BSergio on 06.01.2022.
//

import Foundation

// MARK: - DataManager
struct DataManger {
   
    // MARK: - Public Properties
    static let shortDescription: [Signs: String] = [
        .sign1: "short description for sign1",
        .sign2: "short description for sign2"
    ]
    
    static let longDescription: [Signs: String] = [
        .sign1: "long description for sign1",
        .sign2: "long description for sign2"
    ]
    
}

// MARK: - Signs
enum Signs: String {
    case sign1 = "sign1"
    case sign2 = "sign2"
}

    // TODO название изображение в assets подгружать со значение Signs.rowValue соответсвенно
