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
  let panishments = Punishments()
  
  // MARK: - Private Property
  private lazy var backgroundView: UIImageView = {
    let backgroundView = UIImageView()
    backgroundView.image = UIImage(named: "backgroundImage")
    return backgroundView
  }()
  
  private lazy var topLabel: UILabel = {
    let topLabel = UILabel()
    topLabel.text = "Проигравший выполняет задание"
    topLabel.numberOfLines = 0
    topLabel.textAlignment = .center
    topLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    return topLabel
  }()
  
  private lazy var gameOverImage: UIImageView = {
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
    punishment.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    return punishment
  }()
  
  private lazy var otherTaskButton: UIButton = createButton(text: "Другое Задание")
  private lazy var startOverButton: UIButton = createButton(text: "Начать заново")

  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Actions Methods
  @objc
  func addTapped() {
    navigationController?.popToRootViewController(animated: true)
  }
  
  @objc
  func otherTaskTap() {
    let randomPunishpment = panishments.getPunishments().randomElement()
    punishmentLabel.text = randomPunishpment
  }
  
  @objc
  func startOverTap() {
    navigationController?.popToRootViewController(animated: true)
  }
}

// MARK: - Setting Views
private extension GameEndViewController {
  func setupView() {
    addSubviews()
    setupLayout()
    configureNavController()
    addAction()
  }
}

// MARK: - Setting
private extension GameEndViewController {
  func addSubviews() {
    view.addSubview(backgroundView)
    view.addSubview(topLabel)
    view.addSubview(gameOverImage)
    view.addSubview(punishmentLabel)
    view.addSubview(otherTaskButton)
    view.addSubview(startOverButton)
    
  }
  
  func configureNavController() {
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
  
  func createButton(text: String) -> UIButton {
    let otherTask = UIButton(type: .system)
    otherTask.setTitle(text, for: .normal)
    otherTask.tintColor = UIColor.yellowText
    otherTask.titleLabel?.numberOfLines = 0
    otherTask.titleLabel?.textAlignment = .center
    otherTask.layer.cornerRadius = 30
    otherTask.layer.borderColor = UIColor.black.cgColor
    otherTask.layer.borderWidth = 2
    otherTask.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    otherTask.backgroundColor = UIColor.purpleButton
    return otherTask
  }
  
  func addAction() {
    otherTaskButton.addTarget(self, action: #selector(otherTaskTap), for: .touchUpInside)
    startOverButton.addTarget(self, action: #selector(startOverTap), for: .touchUpInside)
  }
}

// MARK: - Layout
private extension GameEndViewController {
  func setupLayout() {
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    topLabel.translatesAutoresizingMaskIntoConstraints = false
    gameOverImage.translatesAutoresizingMaskIntoConstraints = false
    punishmentLabel.translatesAutoresizingMaskIntoConstraints = false
    otherTaskButton.translatesAutoresizingMaskIntoConstraints = false
    startOverButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
      topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
      topLabel.heightAnchor.constraint(equalToConstant: 100),
      
      gameOverImage.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
      gameOverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      gameOverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      
      punishmentLabel.topAnchor.constraint(equalTo: gameOverImage.bottomAnchor, constant: 30),
      punishmentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      punishmentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      otherTaskButton.topAnchor.constraint(equalTo: punishmentLabel.bottomAnchor, constant: 30),
      otherTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
      otherTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
      otherTaskButton.heightAnchor.constraint(equalToConstant: 70),
      
      startOverButton.topAnchor.constraint(equalTo: otherTaskButton.bottomAnchor, constant: 20),
      startOverButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
      startOverButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
      startOverButton.heightAnchor.constraint(equalToConstant: 70),
      startOverButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ])
  }
}
