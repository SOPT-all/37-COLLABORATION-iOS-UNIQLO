//
//  ColorPickButton.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/18/25.
//

import UIKit

import SnapKit
import Then

protocol ColorPickButtonDelegate: AnyObject {
    func colorPickButtonDidTap(_ button: ColorPickButton)
}

final class ColorPickButton: UIButton {
    weak var delegate: ColorPickButtonDelegate?
    
    private let cornerView = UIImageView()
    private let colorView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setAddTarget()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ColorPickButton {
    private func setStyle() {
        cornerView.do {
            $0.backgroundColor = .clear
            $0.layer.borderColor = UIColor.clear.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = Constants.cornerSize / 2
        }

        colorView.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = Constants.innerSize / 2
        }
    }

    private func setAddTarget() {
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    @objc private func didTap() {
        delegate?.colorPickButtonDidTap(self)
    }

    private func setUI() {
        addSubview(cornerView)
        addSubview(colorView)
    }

    private func setLayout() {
        self.snp.makeConstraints {
            $0.size.equalTo(Constants.cornerSize)
        }

        cornerView.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.size.equalToSuperview()
        }

        colorView.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.size.equalTo(Constants.innerSize)
        }
    }
}

extension ColorPickButton {
    func configure(hex: String) {
                colorView.backgroundColor = UIColor(hexString: hex) ?? .lightGray
    }

    func updateStyle(isSelected: Bool) {
        cornerView.layer.borderColor = isSelected ? UIColor.black.cgColor : UIColor.clear.cgColor
    }
}

extension ColorPickButton {
    private enum Constants {
        static let cornerSize: CGFloat = 41
        static let innerSize: CGFloat = 35
    }
}
