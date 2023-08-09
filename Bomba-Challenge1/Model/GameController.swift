//
//  GameController.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 09.08.2023.
//

import Foundation

class GameController {
    
    var gameData = GameData()

    func start() -> String {
        gameData.questionArray.randomElement() ?? "Нет данных"
    }

    func end() -> String {
        gameData.punishments.randomElement() ?? "Нет данных"
    }

}
