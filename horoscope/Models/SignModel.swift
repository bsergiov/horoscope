//
//  SignModel.swift
//  horoscope
//
//  Created by BSergio on 06.01.2022.
//

import Foundation

// MARK: - SignModel - общий массив данных

struct SignModel {
    
    let sign: String
    let shortDescription: String
    let longDescription: String
    let titleForecast: String
    let fromDate: String
    let beforeDate: String
    let signImg: String
    
    static func getSigns() -> [SignModel] {
        var signs: [SignModel] = []
        
        for cases in Signs.allCases {
            signs.append(
                SignModel(
                    sign: DataManger.sign[cases] ?? "",
                    shortDescription: DataManger.shortDescription[cases] ?? "",
                    longDescription: DataManger.longDescription[cases] ?? "",
                    titleForecast: DataManger.titleForecast[cases] ?? "",
                    fromDate: DataManger.fromDate[cases] ?? "0101",
                    beforeDate: DataManger.beforeDate[cases] ?? "0101",
                    signImg: cases.rawValue)
            )
        }
        return signs
    }
}

// MARK - PersonModel - персональный массив по месяцу

struct PersonModel {
    static func getPersonModel(from date: String) -> SignModel {
        let signs = SignModel.getSigns()
        var person = signs[0]
        let data = Int(date) ?? 0101
        for index in signs {
            let from = Int(index.fromDate) ?? 101
            let before = Int(index.beforeDate) ?? 101
            if before < from {
                if data >= from || data <= before { person = index } // проверка переходного периода через декабрь в январь
            } else {
                if data >= from && data <= before { person = index }
            }
        }
        return person
    }
}

// MARK - DeveloperModel

struct DeveloperModel {
    let name: String
    let title: String
    let image: String
    
    static func getDeveloperModel() -> [DeveloperModel] {
        [
            DeveloperModel(name: "Sergey B", title: "Team leader", image: "sergey"),
            DeveloperModel(name: "Alexander Panin", title: "Developer", image: "alexander")
        ]
    }
}
