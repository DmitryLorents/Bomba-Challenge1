//
//  UILabel+Extension.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 12.08.2023.
//

import UIKit

extension UILabel {
    
    static func label(with name: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = name
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static  func labelTitle(with name: String)-> UILabel {
        let label = UILabel()
        label.text = name
        label.numberOfLines = 0
        label.textColor = UIColor.purpleText
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func labelSubTitle(with name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
