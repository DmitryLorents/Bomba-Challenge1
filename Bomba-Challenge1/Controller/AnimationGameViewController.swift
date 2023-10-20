//
//  AnimationGameViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 10.08.2023.
//

import UIKit
import AVFoundation

final class AnimationGameViewController: UIViewController {
  
  private let gameData = GameData.shared
  
  // MARK: - Private Property
  private let backgroundView = GradientView()
   
  
  private let questionLabel: UILabel = {
    let questionLabel = UILabel()
    questionLabel.numberOfLines = 0
    questionLabel.textColor = UIColor.purpleText
    questionLabel.textAlignment = .center
    questionLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    return questionLabel
  }()
  
  private lazy var animationImageView: UIImageView = {
    let animationImage = UIImageView()
    animationImage.animationImages = animatedImages(for: "Unknown-")
    animationImage.contentMode = .scaleAspectFill
    animationImage.animationDuration = 1.5
    animationImage.image = animationImage.animationImages?.first
    return animationImage
  }()
  
  private var player: AVAudioPlayer?
  private var timer: Timer?
  private var timeLeft = 15
  private var randomQuestion = ""
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    animationImageView.startAnimating()
    
  }
  
  // Action Methods
  @objc private func backButtonPressed() {
    if timer?.isValid ?? false {
      
    } else {
      navigationController?.popToRootViewController(animated: true)
    }
  }
  
  @objc private func pauseButtonPressed() {
    if (timer?.isValid ?? false) {
      timer?.invalidate()
      player?.stop()
      animationImageView.stopAnimating()
      gameData.stopTime = timeLeft
      gameData.stopQuestion = randomQuestion
    } else {
      configureTimer()
      player?.play()
      animationImageView.startAnimating()
    }
  }
  
  @objc private func onTimerFires() {
    timeLeft -= 1
    print(timeLeft)
    //start final animation
    if timeLeft == 1 {
      animationImageView.animationImages = animatedImages(for: "Unknown-4-")
      animationImageView.startAnimating()
      configurePlayer(urlName: "BOOM")
    }
    //finish game and go to next screen
    if timeLeft <= 0 {
      timer?.invalidate()
     
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.player?.stop()
        self.navigationController?.pushViewController(GameEndViewController(), animated: true)
      }
    }
  }
}

// MARK: - Setting Views
private extension AnimationGameViewController {
  func setupView() {
    addSubviews()
    setupLayout()
    configureNavController()
    randomTimer()
    configurePlayer(urlName: "NOK")
    
    if let stopTime = gameData.stopTime, let stopQuestion = gameData.stopQuestion {
      timeLeft = stopTime
      questionLabel.text = stopQuestion
      animationImageView.startAnimating()
      configureTimer()
    } else {
      configureTimer()
      getRandomQuestion()
    }
  }
  
}

// MARK: - Setting
private extension AnimationGameViewController {
  func addSubviews() {
    view.addSubview(backgroundView)
    view.addSubview(questionLabel)
    view.addSubview(animationImageView)
  }
  
  func configureNavController() {
    title = "Игра"
    let appearance = UINavigationBarAppearance()
    appearance.titleTextAttributes = [
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .white
    ]
    
    let leftBarButtonItem = UIBarButtonItem(
      image: UIImage(named: "arrow"),
      style: .done, target: self,
      action: #selector(backButtonPressed)
    )
    
    let rightBarButtonItem = UIBarButtonItem(
      image: UIImage(named: "pause"),
      style: .done, target: self,
      action: #selector(pauseButtonPressed)
    )
    
    leftBarButtonItem.tintColor = .black
    rightBarButtonItem.tintColor = .black
    navigationItem.leftBarButtonItem = leftBarButtonItem
    navigationItem.rightBarButtonItem = rightBarButtonItem
    navigationController?.navigationBar.standardAppearance = appearance
  }
  
  func animatedImages(for name: String) -> [UIImage] {
    var i = 0
    var images = [UIImage]()
    
    while let image = UIImage(named: "\(name)\(i)") {
      images.append(image)
      i += 1
    }
    return images
  }
  
  func randomTimer() {
    let random = Int.random(in: 1...15)
    timeLeft += random
  }
  
  func configureTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
  }
  
  func configurePlayer(urlName: String) {
    guard let url = Bundle.main.url(forResource: urlName, withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      guard let player else { return }
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func getRandomQuestion() {
    randomQuestion = gameData.getRandomQuestion()
    questionLabel.text = randomQuestion
  }
}

private extension AnimationGameViewController {
  func setupLayout() {
   
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    animationImageView.translatesAutoresizingMaskIntoConstraints = false
      
      backgroundView.snp.makeConstraints {make in
          make.edges.equalToSuperview()
      }
      
      questionLabel.snp.makeConstraints { make in
          make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
          make.leading.trailing.equalToSuperview().inset(20)
      }
    
      animationImageView.snp.makeConstraints { make in
          make.top.equalTo(questionLabel.snp.bottom).inset(-150)
          make.leading.trailing.equalTo(questionLabel)
      }
  }
}



