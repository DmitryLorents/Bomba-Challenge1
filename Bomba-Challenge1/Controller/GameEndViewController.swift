//
//  GameEndViewController.swift
//  Bomba-Challenge1
//
//  Created by Андрей Фроленков on 9.08.23.
//

import Foundation
import UIKit

// MARK: - GameEndViewController
final class GameEndViewController: UIViewController {
    
    // MARK: - panishments Model
    let panishments = GameData.shared.punishments
    
    // MARK: - Private Property
    private let backgroundView = GradientView()
    
    private let topLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.text = "Проигравший выполняет задание"
        topLabel.numberOfLines = 0
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return topLabel
    }()
    
    private let gameOverImage: UIImageView = {
        let gameOverImage = UIImageView()
        gameOverImage.image = UIImage(named: "gameOver")
        return gameOverImage
    }()
    
    private lazy var punishmentLabel: UILabel = {
        let punishment = UILabel()
        punishment.text = "В следующем раунде после каждого ответа хлопать в ладоши"
        punishment.numberOfLines = 0
        punishment.textColor = UIColor.purpleText
        punishment.textAlignment = .center
        punishment.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        punishment.sizeToFit()
        return punishment
    }()
    
    private let otherTaskButton = CustomButton(title: "Другое \nЗадание")
    private let startOverButton = CustomButton(title: "Начать \nЗаново")
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //make round corners for buttons
        otherTaskButton.roundCorners()
        startOverButton.roundCorners()
    }
    
    
    // MARK: - Actions Methods
    @objc func addTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func otherTaskTap() {
        randomPanishment()
    }
    
    @objc func startOverTap() {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Setting Views
extension GameEndViewController {
    private func setupView() {
        addSubviews()
        setupLayout()
        configureNavController()
        addAction()
        randomPanishment()
    }
}

// MARK: - Setting
extension GameEndViewController {
    private func addSubviews() {
        view.addSubview(backgroundView)
        view.addSubview(topLabel)
        view.addSubview(gameOverImage)
        view.addSubview(punishmentLabel)
        view.addSubview(otherTaskButton)
        view.addSubview(startOverButton)
    }
    
    private func configureNavController() {
        title = "Игра"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
                                          NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .white]
        navigationController?.navigationBar.standardAppearance = appearance
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(addTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func randomPanishment() {
        punishmentLabel.text = panishments.randomElement()
    }
    
    private func addAction() {
        otherTaskButton.addTarget(self, action: #selector(otherTaskTap), for: .touchUpInside)
        startOverButton.addTarget(self, action: #selector(startOverTap), for: .touchUpInside)
    }
}

// MARK: - Layout
private extension GameEndViewController {
    func setupLayout() {
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        gameOverImage.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        punishmentLabel.snp.makeConstraints { make in
            make.top.equalTo(gameOverImage.snp.bottom).inset(-30)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        startOverButton.snp.makeConstraints { make in
            make.height.equalTo(79)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        otherTaskButton.snp.makeConstraints { make in
            make.height.leading.trailing.equalTo(startOverButton)
            make.bottom.equalTo(startOverButton.snp.top).inset(-20)
            make.top.equalTo(punishmentLabel.snp.bottom).inset(-30)
        }
    }
}
