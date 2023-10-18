//
//  CustomButton.swift
//  Bomba-Challenge1
//
//  Created by Dmitry on 16.10.2023.
//

import UIKit

class CustomButton: UIButton {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Custom init
    init(title: String) {
        
        super.init(frame: .zero)
        self.backgroundColor = .purpleButton
        self.setTitle(title, for: .normal)
        self.setTitleColor(.yellowText, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 24)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        
    }
    
}
