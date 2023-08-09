//
//  CategoryViewController.swift
//  Bomba-Challenge1
//
//  Created by Андрей Фроленков on 8.08.23.
//

import Foundation
import UIKit

// MARK: - CategoryViewController
final class CategoryViewController: UIViewController {
  
  private let categoryImageArray = Category.CategoryImage.allCases
  private let nameCategoryArray = Category.CategoryName.allCases
  // MARK: - Private Property
  private lazy var backgroundView: UIImageView = {
    let backgroundView = UIImageView()
    backgroundView.image = UIImage(named: "backgroundImage")
    return backgroundView
  }()
  
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()

  }
  
  // MARK: - Actions Methods
  @objc
  func addTapped() {
    navigationController?.popViewController(animated: true)
  }
  
}

// MARK: - Setting Views
private extension CategoryViewController {
  func setupView() {
    view.backgroundColor = .white
    addSubviews()
    setupLayout()
    configureCollectionView()
    configureNavController()
  }
  
}

// MARK: - Setting
private extension CategoryViewController {
  func addSubviews() {
    view.addSubview(backgroundView)
    view.addSubview(collectionView)
  }
  
  func configureCollectionView() {
    collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  func configureNavController() {
    title = "Категории"
   
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = .purple
    appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
                                      NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .white]
    navigationController?.navigationBar.standardAppearance = appearance
    let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(addTapped))
    leftBarButtonItem.tintColor = .black
    navigationItem.leftBarButtonItem = leftBarButtonItem
  }
  
}

// MARK: - Layout
private extension CategoryViewController {
  func setupLayout() {
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryImageArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
    
    let nameImage = categoryImageArray[indexPath.row].rawValue
    let image = UIImage(named: nameImage)
    let nameCategory = nameCategoryArray[indexPath.row]
    cell.imageView.image = image
    cell.nameCategory.text = nameCategory.rawValue

    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell else { return }
    cell.selectCell = !cell.selectCell
    cell.checkmark.image = cell.selectCell ? UIImage(named: "checkmarkOn") :  UIImage(named: "checkmarkOff")
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemsPerRow: CGFloat = 2
    let paddingWidth = 20 * (itemsPerRow + 1)
    let availableWidth = collectionView.frame.width - paddingWidth
    let widthPerItem = availableWidth / itemsPerRow
    return CGSize(width: widthPerItem, height: widthPerItem)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}
