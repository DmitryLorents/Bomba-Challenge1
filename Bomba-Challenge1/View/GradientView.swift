//
//  GradientView.swift
//  Bomba-Challenge1
//
//  Created by Андрей Фроленков on 10.08.23.
//

import Foundation
import UIKit

final class GradientView: UIView {
  
  private lazy var gradientLayer: CAGradientLayer = {
      let gradientLayer = CAGradientLayer()
      gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
      gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 0, y: 1)
      return gradientLayer
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private Methods
  private func addSubviews() {
    layer.addSublayer(gradientLayer)
  }
  
  override func layoutSubviews() {
    gradientLayer.frame = layer.frame
  }
  
}
