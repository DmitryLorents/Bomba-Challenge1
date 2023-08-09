//
//  GameViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 07.08.2023.
//

import UIKit

final class GameViewController: UIViewController {
    
    //MARK: - UI
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.cornerRadius = 20
        return gradientLayer
      }()
    
    
    
    
    
    lazy var backgroundView: UIView = {
        let verticalView = UIView()
        verticalView.layer.cornerRadius = 20
        verticalView.layer.shadowColor = UIColor.black.cgColor
        verticalView.layer.shadowRadius = 10
        verticalView.layer.shadowOffset = CGSize.zero
        verticalView.layer.shadowOpacity = 1
        verticalView.backgroundColor = .darkGray
        verticalView.layer.addSublayer(gradientLayer)
        verticalView.translatesAutoresizingMaskIntoConstraints = false
        return verticalView
      }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 10
        element.distribution = .fillProportionally
        element.alignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainLabelView: UILabel = {
        let label = UILabel()
        label.text = """
        Нажмите
        "Запустить" чтобы
        начать игру
        """
        label.numberOfLines = 0
        label.textColor = UIColor.purpleText
        label.textAlignment = .center
        label.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundGame: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "bombGame")
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var button: UIButton = {
        var element = UIButton(type: .system)
        element.titleLabel?.font = .systemFont(ofSize: 25)
        element.backgroundColor = UIColor.purpleButton
        element.layer.cornerRadius = 35
        element.setTitle("Запустить", for: .normal)
        element.setTitleColor(.yellow, for: .normal)
        element.layer.borderWidth = 2
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = backgroundView.bounds
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }
    
    //MARK: - Setup Views
    
    private func setViews() {
        view.addSubview(backgroundView)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(mainLabelView)
        mainStackView.addArrangedSubview(backgroundGame)
        mainStackView.addArrangedSubview(button)
    }
}

    //MARK: - Setup Constraints

extension GameViewController {
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            button.widthAnchor.constraint(equalToConstant: 274),
            button.heightAnchor.constraint(equalToConstant: 79)
        ])
    }
}
