//
//  Category.swift
//  Bomba-Challenge1
//
//  Created by Андрей Фроленков on 9.08.23.
//

import Foundation

struct Category {
  
  enum CategoryImage: String, CaseIterable {
    case category1
    case category2
    case category3
    case category4
    case category5
    case category6
  }
  
  enum CategoryName: String, CaseIterable {
    case category1 = "О Разном"
    case category2 = "Спорт и Хобби"
    case category3 = "Про Жизнь"
    case category4 = "Знаменитости"
    case category5 = "Искусство и Кино"
    case category6 = "Природа"
  }
  
  
}
