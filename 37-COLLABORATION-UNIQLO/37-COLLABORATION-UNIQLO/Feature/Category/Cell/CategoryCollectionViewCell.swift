//
//  CategoryCollectionViewCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/21/25.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubviews(imageView, titleLabel)
    }
    
    private func setStyle() {
        imageView.do {
            $0.contentMode = .scaleAspectFill
        }
        
        titleLabel.do {
            $0.font = .pretendard(.captionL10)
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(3.5)
            $0.width.height.equalTo(56)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(1.5)
        }
    }
}

extension CategoryCollectionViewCell {
    func bind(with item: OuterItemModel) {
        self.imageView.image = item.image
        self.titleLabel.text = item.item
    }
}
