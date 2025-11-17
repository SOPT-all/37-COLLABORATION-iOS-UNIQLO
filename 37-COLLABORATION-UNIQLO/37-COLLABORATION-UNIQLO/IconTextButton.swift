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
    private let iconImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    private let textLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .pretendard(.captionR12)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(icon: UIImage?, text: String) {
        iconImage.image = icon
        textLabel.text = text
    }
}

extension IconTextButton {
    private func setStyle() {
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.gray200.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 17
    }

    private func setUI() {
        addSubview(iconImage)
        addSubview(textLabel)
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
