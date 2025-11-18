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
            return UIImage(named: "heart_filled")
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
}

final class IconCircleButton: UIButton {
    private let type: IconButtonType

    init(type: IconButtonType) {
        self.type = type
        super.init(frame: .zero)
        setImage()
        setAddtarget()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IconCircleButton {
    private func setImage() {
        
    }

    private func setAddtarget() {
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
