//
//  ProductColorSelectorView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class ProductColorSelectorView: BaseView {

    private let stackView = UIStackView()
    private var buttons: [ColorPickButton] = []
    private var selectedButton: ColorPickButton?

    var onColorSelected: ((ColorOption) -> Void)?

    override func setStyle() {
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
        }
    }

    override func setUI() {
        addSubview(stackView)
    }

    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ProductColorSelectorView {
    func configure(options: [ColorOption]) {
        eraseAll()
        
        let newButtons = options.map { option -> ColorPickButton in
            let btn = ColorPickButton()
            btn.configure(hex: option.hex)
            btn.onTap = { [weak self] in
                self?.handleSelection(button: btn, option: option)
            }
            return btn
        }

        buttons = newButtons

        newButtons.forEach { stackView.addArrangedSubview($0) }

        if let first = buttons.first,
           let option = options.first {
            handleSelection(button: first, option: option)
        }
    }
    
    private func eraseAll() {
        buttons.forEach { $0.removeFromSuperview() }
        buttons.removeAll()
        selectedButton = nil
    }

    private func handleSelection(button: ColorPickButton, option: ColorOption) {
        selectedButton?.updateStyle(isSelected: false)
        button.updateStyle(isSelected: true)
        selectedButton = button

        onColorSelected?(option)
    }
}
