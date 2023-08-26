//
//  RulesVCViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 08.08.2023.
//

import UIKit
import SnapKit

final class RulesViewController: UIViewController {
    
    //MARK: - UI
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.cornerRadius = 20
        return gradientLayer
    }()
    
    private lazy var gradientBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 1
        view.layer.addSublayer(gradientLayer)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private let labelTitle = UILabel.labelTitle(with: "Правила Игры")
    private let categoryLabel = UILabel.labelTitle(with: "Категории")
    private let label8 = UILabel.labelSubTitle(with: "В игре доступно 6 категорий и более 90 вопросов.")
    private let label9 = UILabel.labelSubTitle(with: "Можно выбрать сразу несколько категорий для игры.")

    private var playButtonImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "gameStartButtonImage"))
        view.contentMode = .scaleAspectFill
        view.frame = CGRect(origin: .zero, size: CGSize(width: 112, height: 27))
        return view
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = gradientBackgroundView.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 500)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        //setupColors()
        configureNavController()
        setupConstrains()
    }
    
    //MARK: - Private Properties
    
    private let imageViewOne = UIImageView.view29x29(imageName: "numberOne")
    private let imageViewTwo = UIImageView.view29x29(imageName: "numberTwo")
    private let imageViewThree = UIImageView.view29x29(imageName: "numberThree")
    private let imageViewFour = UIImageView.view29x29(imageName: "numberFour")
    private let imageViewFive = UIImageView.view29x29(imageName: "numberFive")
    private let imageViewSix = UIImageView.view29x29(imageName: "numberSix")
    private let imageViewSeven = UIImageView.view29x29(imageName: "numberSeven")
    private let imageViewCategory1 = UIImageView(image: UIImage(named: "otherCategory"))
    private let imageViewCategory2 = UIImageView(image: UIImage(named: "movieCategory"))
    private let imageViewCategory3 = UIImageView(image: UIImage(named: "natureCategory"))
    private let imageViewCategory4 = UIImageView(image: UIImage(named: "sportCategory"))
    
    private let labelOne = UILabel.label(with: "Все игроки становятся в круг.")
    private let labelTwo = UILabel.label(with: "Первый игрок берет телефон и нажимает кнопку:")
    private let labelThree = UILabel.label(with: "На экране появляется вопрос “Назовите Фрукт”.")
    private let labelFour = UILabel.label(with: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники).")
    private let labelFive = UILabel.label(with: "Игроки по кругу отвечают на один и тот же вопрос до тех пор,  пока не взорвется бомба.")
    private let labelSix = UILabel.label(with: "Проигравшим считается тот, в чьих руках взорвалась бомба.")
    private let labelSeven = UILabel.label(with: "Если в настройках выбран режим игры “С Заданиями”, то проигравший выполняет  задание.")
    
}

extension RulesViewController {
    
    //MARK: - Configure Nav Controller
    
    private func configureNavController() {
        title = "Помощь"
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.purpleText ?? .white
        ]
        
        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrow"),
            style: .done, target: self,
            action: #selector(backButtonPressed)
        )
        
        leftBarButtonItem.tintColor = .black
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    @objc private func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Setup Views
    
    private func setupViews() {
        view.addSubview(gradientBackgroundView)
        gradientBackgroundView.addSubview(scrollView)
        
        scrollView.addSubview(labelTitle)
        scrollView.addSubview(imageViewOne)
        scrollView.addSubview(labelOne)
        scrollView.addSubview(imageViewTwo)
        scrollView.addSubview(labelTwo)
        scrollView.addSubview(playButtonImageView)
        scrollView.addSubview(imageViewThree)
        scrollView.addSubview(labelThree)
        scrollView.addSubview(imageViewFour)
        scrollView.addSubview(labelFour)
        scrollView.addSubview(imageViewFive)
        scrollView.addSubview(labelFive)
        scrollView.addSubview(imageViewSix)
        scrollView.addSubview(labelSix)
        scrollView.addSubview(imageViewSeven)
        scrollView.addSubview(labelSeven)
        scrollView.addSubview(categoryLabel)
        scrollView.addSubview(label8)
        scrollView.addSubview(label9)
        scrollView.addSubview(imageViewCategory1)
        scrollView.addSubview(imageViewCategory2)
        scrollView.addSubview(imageViewCategory3)
        scrollView.addSubview(imageViewCategory4)
        
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstrains() {
        
        gradientBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        labelTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
        }
        imageViewOne.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).inset(-26)
            make.leading.equalToSuperview().inset(8)
        }
        labelOne.snp.makeConstraints { make in
            make.leading.equalTo(imageViewOne.snp.trailing).inset(16)
            make.top.equalTo(imageViewOne).inset(29)
            // make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        imageViewTwo.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            //make.leading.equalTo(imageViewOne)
            make.top.equalTo(labelOne.snp.bottom)
        }
        labelTwo.snp.makeConstraints { make in
            //make.leading.equalTo(labelOne)
            make.leading.equalTo(imageViewTwo.snp.trailing).inset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(imageViewTwo).inset(29)
        }
        playButtonImageView.snp.makeConstraints { make in
            make.top.equalTo(labelTwo.snp.bottom).inset(8)
            make.centerX.equalToSuperview()
        }
        imageViewThree.snp.makeConstraints { make in
            make.top.equalTo(playButtonImageView.snp.bottom).inset(39)
            make.leading.equalToSuperview().inset(8)
        }
        labelThree.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(imageViewThree).inset(29)
            make.leading.equalTo(imageViewOne.snp.trailing).inset(16)
        }
        imageViewFour.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(labelThree.snp.bottom)
        }
        labelFour.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(imageViewFour).inset(29)
            make.leading.equalTo(imageViewFour.snp.trailing).inset(16)
        }
        imageViewFive.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(labelFour.snp.bottom)
        }
        labelFive.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(imageViewFive).inset(29)
            make.leading.equalTo(imageViewFive.snp.trailing).inset(16)
        }
        imageViewSix.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(labelFive.snp.bottom)
        }
        labelSix.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(imageViewSix).inset(29)
            make.leading.equalTo(imageViewSix.snp.trailing).inset(16)
        }
        imageViewSeven.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(labelSix.snp.bottom)
        }
        labelSeven.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(imageViewSeven).inset(29)
            make.leading.equalTo(imageViewSeven.snp.trailing).inset(16)
        }
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageViewSeven.snp.bottom).inset(-20)
        }
        label8.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).inset(-40)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        label9.snp.makeConstraints { make in
            make.top.equalTo(label8.snp.bottom).inset(-40)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        imageViewCategory1.snp.makeConstraints { make in
            make.top.equalTo(label9.snp.bottom).inset(-40)
            make.leading.equalToSuperview().inset(8)
            make.height.width.equalTo(imageViewCategory1.snp.width)
        }
        imageViewCategory2.snp.makeConstraints { make in
            make.top.equalTo(imageViewCategory1)
            make.leading.equalTo(imageViewCategory1.snp.trailing).inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(imageViewCategory2.snp.width)
        }
        imageViewCategory3.snp.makeConstraints { make in
            make.top.equalTo(imageViewCategory1.snp.bottom).inset(16)
            make.leading.equalToSuperview().inset(8)
            make.height.equalTo(imageViewCategory3.snp.width)
        }
        imageViewCategory4.snp.makeConstraints { make in
            make.top.equalTo(imageViewCategory3)
            make.leading.equalTo(imageViewCategory3.snp.trailing).inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(imageViewCategory4.snp.width)
        }
    }
}
