//
//  StyleHintItemCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class StyleHintItemCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let heartButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setAddTarget()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        heartButton.do {
            $0.setImage(.heartDefault, for: .normal)
            $0.setImage(.heartFilled, for: .selected)
        }
    }

    private func setUI() {
        addSubviews(imageView, heartButton)
    }

    private func setAddTarget() {
        heartButton.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
    }

    @objc private func heartButtonDidTap() {
        heartButton.isSelected.toggle()
    }

    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        heartButton.snp.makeConstraints {
            $0.top.equalTo(imageView).inset(16)
            $0.trailing.equalTo(imageView).inset(14)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        heartButton.isSelected = false
    }
}

extension StyleHintItemCell {
    func configure(item: UIImage?) {
        imageView.image = item
    }
}
