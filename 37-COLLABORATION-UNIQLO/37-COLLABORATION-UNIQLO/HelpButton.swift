//
//  HelpButton.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class HelpButton: UIButton {
    private let textLabel = UILabel()
    private var count = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setAction()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HelpButton {
    private func setStyle() {
        self.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 17
        }
        textLabel.do {
            $0.text = "도움돼요 \(count)"
            $0.textColor = .black
            $0.font = .pretendard(.captionR12)
        }
    }

    private func setAction() {
        addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }

    @objc private func buttonDidTap() {
        count += 1
        textLabel.text = "도움돼요 \(count)"
        textLabel.textColor = .white
        backgroundColor = .black
        isEnabled = false
    }

    private func setUI() {
        addSubview(textLabel)
    }

    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(34)
        }

        textLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
    }
}

extension HelpButton {
    func configure(count: Int) {
        self.count = count
        textLabel.text = "도움돼요 \(count)"
    }
}
