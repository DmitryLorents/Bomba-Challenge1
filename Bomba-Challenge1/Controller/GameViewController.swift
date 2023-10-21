//
//  GameViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 07.08.2023.
//

import UIKit

final class GameViewController: UIViewController {
    
    //MARK: - UI
    
    private let mainBackgroundView = GradientView()
    private let backgroundGameImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "bombGame")
        view.contentMode = .scaleAspectFit
        return view
    }()
    private var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 5
        element.alignment = .center
        element.distribution = .fillProportionally
        return element
    }()
    
    private let mainLabelView: UILabel = {
        let label = UILabel()
        label.text = """
        Нажмите
        "Запустить" чтобы
        начать игру
        """
        label.numberOfLines = 0
        label.textColor = UIColor.purpleText
        label.textAlignment = .center
        label.layer.borderColor = UIColor.black.cgColor
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    private var playButton = CustomButton(title: "Запустить")
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        configureNavController()
        setupConstrains()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playButton.roundCorners()
    }
     
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        playButton.roundCorners()
//    }
    
    //MARK: - Methods
    
    private func configureNavController() {
        title = "Игра"
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .white
        ]
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"),style: .done, target: self,action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
}

extension GameViewController {
    
    private func setViews() {
        playButton.addTarget(self, action: #selector(startGameButtonPressed), for: .touchUpInside)
        view.addSubview(mainBackgroundView)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(mainLabelView)
        mainStackView.addArrangedSubview(backgroundGameImageView)
        mainStackView.addArrangedSubview(playButton)
    }
    
    private func setupConstrains() {
        
        mainBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        playButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50-8)
            make.height.equalTo(80)
        }
    }
    
    //MARK: - Button methods
    
    @objc private func startGameButtonPressed() {
        navigationController?.pushViewController(AnimationGameViewController(), animated: true)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}
