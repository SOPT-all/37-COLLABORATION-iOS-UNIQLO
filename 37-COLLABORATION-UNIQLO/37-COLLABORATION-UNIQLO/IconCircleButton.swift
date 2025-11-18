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
            return UIImage(named: "hanger")
        case .up:
            return UIImage(named: "up")
        case .share:
            return UIImage(named: "share")
        case .heart:
            return UIImage(named: "heart_default")
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
        setupImage()
        setupActions()
        setupStyle()
        setupSize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IconCircleButton {
    func setupImage() {
        setImage(type.icon, for: .normal)
        if let selectedIcon = type.selectedIcon {
            setImage(selectedIcon, for: .selected)
        }
    }

    func setupActions() {
        addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }

    @objc func buttonDidTap() {
        isSelected.toggle()
    }

    func setupStyle() {
        backgroundColor = type.backgroundColor
        layer.cornerRadius = type.size / 2
        clipsToBounds = true
    }

    func setupSize() {
        snp.makeConstraints { $0.size.equalTo(type.size) }
    }
}
