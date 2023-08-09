//
//  GameData.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 09.08.2023.
//

import Foundation

struct GameData {
    
    let categories: [Category]
    let punishments: [String]
    lazy var questionArray: [String] = {
        var array = [String]()
        self.categories.forEach { category in
            if category.isSelected {
                array += category.questions
            }
        }
        return array
    }()
    
    init() {
        let generalCategory = Category(name: "О разном",
                                       imageName: "category1",
                                       questions: ["Вопрос1",
                                                   "Вопрос2"
                                       ])
        let sportCategory = Category(name: "Спорт и Хобби",
                                       imageName: "category2",
                                       questions: ["Вопрос1",
                                                   "Вопрос2"
                                       ])
        let lifeCategory = Category(name: "Про Жизнь",
                                       imageName: "category3",
                                       questions: ["Вопрос1",
                                                   "Вопрос2"
                                       ])
        let celebrityCategory = Category(name: "Знаменитости",
                                       imageName: "category4",
                                       questions: ["Вопрос1",
                                                   "Вопрос2"
                                       ])
        let movieCategory = Category(name: "Искусство и Кино",
                                       imageName: "category5",
                                       questions: ["Вопрос1",
                                                   "Вопрос2"
                                       ])
        let natureCategory = Category(name: "Природа",
                                       imageName: "category6",
                                       questions: ["Вопрос1",
                                                   "Вопрос2"
                                       ])
    categories = [generalCategory, sportCategory, lifeCategory, celebrityCategory, movieCategory, natureCategory]
        punishments = [
        "Наказание 1",
        "Наказание2",
        "Наказание3",
        "Наказание4",
        "Наказание5",
        "Наказание6",
        "Наказание7",
        "Наказание8",
        "Наказание9",
        "Наказание10",
        ]
    }
    
}
