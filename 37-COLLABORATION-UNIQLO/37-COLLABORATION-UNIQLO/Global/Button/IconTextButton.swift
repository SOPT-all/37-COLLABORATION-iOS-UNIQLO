//
//  IconTextButton.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class IconTextButton: UIButton {
    private let iconImage = UIImageView()
    private let textLabel = UILabel()

    init(icon: UIImage?, text: String) {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
        iconImage.image = icon
        textLabel.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        self.do {
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.gray200.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 17
        }

        iconImage.do {
            $0.contentMode = .scaleAspectFit
        }

        textLabel.do {
            $0.textColor = .black
            $0.font = .pretendard(.captionR12)
        }
    }

    private func setUI() {
        addSubviews(iconImage, textLabel)
    }

    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(34)
        }

        iconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(22)
            $0.leading.equalToSuperview().inset(10)
        }

        textLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImage.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}
