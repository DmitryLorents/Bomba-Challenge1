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
        view.addSubview(mainLabelView)
        view.addSubview(backgroundGameImageView)
        view.addSubview(playButton)
    }
    
    private func setupConstrains() {
        
        mainBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainLabelView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        backgroundGameImageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainLabelView)
            make.top.equalTo(mainLabelView.snp.bottom)
            make.bottom.greaterThanOrEqualTo(playButton.snp.top).priority(200)
        }
        
        playButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
            
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
