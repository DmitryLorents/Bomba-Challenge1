//
//  MainViewController.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 08.08.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    //MARK: Propperties
    private var backgroungImageView: UIImageView = {
        let backgroundImage = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: backgroundImage)
        return imageView
    }()
    private var rulesButton: UIButton = {
        let button = UIButton()
        let rulesImage = UIImage(named: "rules")
        button.setImage(rulesImage, for: .normal)
        return button
    }()
    
    private var startGameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purpleButton
        button.setTitle("Старт игры", for: .normal)
        button.setTitleColor(.yellowText, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        return button
    }()
    
    private var categoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purpleButton
        button.setTitle("Категории", for: .normal)
        button.setTitleColor(.yellowText, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        return button
    }()
    
    private var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра для компании"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private var bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "БОМБА"
        label.font = .boldSystemFont(ofSize: 48)
        label.textColor = .purpleText
        label.textAlignment = .center
        return label
    }()
    
    private var bombImageView: UIImageView = {
        let bombImage = UIImage(named: "bombImage")
        let imageView = UIImageView(image: bombImage)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOutlets()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roundCornersForButtons()
    }
}

extension MainViewController {
    
    //MARK: Methods
    private func setOutlets() {
        view.addSubview(backgroungImageView)
        view.addSubview(rulesButton)
        view.addSubview(categoryButton)
        view.addSubview(startGameButton)
        view.addSubview(topLabel)
        view.addSubview(bottomLabel)
        view.addSubview(bombImageView)
        startGameButton.addTarget(self, action: #selector(startGameButtonPressed), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(categoryButtonPressed), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
    }
    
    private func setConstraints() {
        backgroungImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        rulesButton.snp.makeConstraints { make in
            make.height.width.equalTo(58)
            make.bottom.trailing.equalToSuperview().inset(17)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.height.equalTo(79)
            make.leading.trailing.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().inset(94)
        }
        
        startGameButton.snp.makeConstraints { make in
            make.leading.trailing.height.equalTo(categoryButton)
            make.bottom.equalTo(categoryButton.snp.top).inset(-15)
        }
        
        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(52)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).inset(8)
            make.centerX.equalToSuperview()
        }
        
        bombImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalTo(bottomLabel.snp.bottom)
            make.bottom.equalTo(startGameButton.snp.top).inset(-15)
        }
        
    }
    
    fileprivate func roundCornersForButtons() {
        startGameButton.layer.cornerRadius = startGameButton.bounds.height / 2
        categoryButton.layer.cornerRadius = categoryButton.bounds.height / 2
    }
    //MARK: - Button methods
    @objc private func startGameButtonPressed() {
         navigationController?.pushViewController(GameViewController(), animated: true)
    }
    
    @objc private func categoryButtonPressed() {
         navigationController?.pushViewController(CategoryViewController(), animated: true)
    }
    
    @objc private func rulesButtonPressed() {
        // navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
    
}
