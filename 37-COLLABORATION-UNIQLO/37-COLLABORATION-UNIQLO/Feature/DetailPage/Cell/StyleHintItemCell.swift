//
//  StyleHintItemCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

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
            $0.top.equalTo(imageView).inset(4)
            $0.trailing.equalTo(imageView).inset(4)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        heartButton.isSelected = false
    }
    
    func configure(urlString: String) {
        if let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
    }
}

extension StyleHintItemCell {
    func configure(item: UIImage?) {
        imageView.image = item
    }
}
