//
//  CategoryCell.swift
//  Bomba-Challenge1
//
//  Created by Андрей Фроленков on 8.08.23.
//

import Foundation
import UIKit

// MARK: - CategoryCell
final class CategoryCell: UICollectionViewCell {
    
    // MARK: - Static Properties
    static let reuseId = String(describing: CategoryCell.self)
    
    // MARK: - Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameCategory: UILabel = {
        let nameCategory = UILabel()
        nameCategory.textAlignment = .center
        nameCategory.textColor = .yellowText
        nameCategory.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        nameCategory.numberOfLines = 1
        return nameCategory
    }()
    
    private lazy var checkmark: UIImageView = {
        let checkmark = UIImageView()
        checkmark.image = (self.selectCell) ? UIImage(named: "checkmarkOn") : UIImage(named: "checkmarkOff")
        return checkmark
    }()
    
    var selectCell = false {
        didSet {
            checkmark.image = (self.selectCell) ? UIImage(named: "checkmarkOn") : UIImage(named: "checkmarkOff")
        }
    }
    
    // MARK: - Initializers
    
    func setCell(with gameData: GameData, indexPath: IndexPath) {
        //checkmark.image = gameData.categories[indexPath.row].isSelected ? UIImage(named: "checkmarkOn") :  UIImage(named: "checkmarkOff")
        
        let category = gameData.categories[indexPath.row]
        imageView.image = UIImage(named: category.imageName)
        nameCategory.text = category.name
        selectCell = category.isSelected
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        addSubviews()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupCell() {
        backgroundColor = .purpleButton
        layer.cornerRadius = 40
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameCategory)
        contentView.addSubview(checkmark)
    }
    
    private func setupLayout() {
        
        imageView.snp.makeConstraints { make in
            make.width.height.lessThanOrEqualTo(90)
            make.center.equalToSuperview()
        }
        
        nameCategory.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(1)
            make.leading.trailing.equalToSuperview().inset(22)
            make.bottom.equalToSuperview()
        }
        
        checkmark.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(15)
        }
        
    }
}
