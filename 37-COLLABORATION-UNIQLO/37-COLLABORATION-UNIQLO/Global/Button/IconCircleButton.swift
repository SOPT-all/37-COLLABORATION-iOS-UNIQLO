//
//  IconCircleButton.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/18/25.
//

import UIKit

import SnapKit

enum IconButtonType {
    case hanger
    case up
    case share
    case heart

    var icon: UIImage? {
        switch self {
        case .hanger:
            return .hanger
        case .up:
            return .up
        case .share:
            return .share
        case .heart:
            return .heartDefault
        }
    }

    var size: CGFloat {
        switch self {
        case .hanger:
            return 32
        case .up, .share:
            return 40
        case .heart:
            return 46
        }
    }

    var selectedIcon: UIImage? {
        switch self {
        case .heart:
            return .heartFilled
        default:
            return nil
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .hanger:
            return .black
        default:
            return .white
        }
    }

    var borderColor: UIColor? {
        switch self {
        case .hanger:
            return nil
        default:
            return .gray200
        }
    }
}

final class IconCircleButton: UIButton {
    private let type: IconButtonType

    init(type: IconButtonType) {
        self.type = type
        super.init(frame: .zero)
        setAddTarget()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) {
                self.alpha = self.isHighlighted ? 0.5 : 1.0
                self.backgroundColor = self.isHighlighted ? .gray : self.type.backgroundColor
            }
        }
    }
}

extension IconCircleButton {
    private func setAddTarget() {
        addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }

    @objc func buttonDidTap() {
        isSelected.toggle()
    }

    private func setStyle() {
        self.do {
            $0.backgroundColor = type.backgroundColor
            $0.layer.cornerRadius = type.size / 2
            $0.clipsToBounds = true
            if let borderColor = type.borderColor {
                $0.layer.borderWidth = 1
                $0.layer.borderColor = borderColor.cgColor
            }
            $0.setImage(type.icon, for: .normal)
            if let selectedIcon = type.selectedIcon {
                $0.setImage(selectedIcon, for: .selected)
            }
        }
    }

    private func setLayout() {
        snp.makeConstraints { $0.size.equalTo(type.size) }
    }
}
