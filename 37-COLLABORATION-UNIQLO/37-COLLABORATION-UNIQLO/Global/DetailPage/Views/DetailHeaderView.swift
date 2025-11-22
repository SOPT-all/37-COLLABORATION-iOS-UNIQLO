//
//  DetailHeaderView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class DetailHeaderView: BaseView {
    
    var onTabSelected: ((Int) -> Void)?
    
    private let titles = ["제품 상세", "사이즈 안내", "Style hint", "리뷰"]
    private let stackView = UIStackView()
    private var buttons: [UIButton] = []
    
    private var selectedIndex: Int = 0 {
        didSet {
            updateButtonStyles()
        }
    }

    override func setStyle() {
        stackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 0
        }
    }

    override func setUI() {
        buttons = titles.map { title in
            UIButton().then {
                $0.setTitle(title, for: .normal)
                $0.titleLabel?.font = .pretendard(.captionM12)
                $0.addTarget(self, action: #selector(tabTapped(_:)), for: .touchUpInside)
            }
        }
        buttons.forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
    }

    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(46)
        }
        updateButtonStyles()
    }

    @objc private func tabTapped(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else {
            return
        }
        onTabSelected?(index)
        selectedIndex = index
    }

    private func updateButtonStyles() {
        for (index, button) in buttons.enumerated() {
            let backgroundColor: UIColor = (index == selectedIndex) ? .white : .gray100
            let titleColor: UIColor = (index == selectedIndex) ? .black : .gray400
            button.backgroundColor = backgroundColor
            button.setTitleColor(titleColor, for: .normal)
        }
    }
    
    func setSelectedIndex(idx: Int) {
        selectedIndex = idx
    }
}
