//
//  PageIndicatorView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class PageIndicatorView: UIView {

    private let currentLabel = UILabel()
    private let separatorLabel = UILabel()
    private let totalLabel = UILabel()

    private let hStack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setStyle() {
        backgroundColor = .black50

        currentLabel.do {
            $0.font = .pretendard(.captionL10)
            $0.textColor = .white
        }

        separatorLabel.do {
            $0.font = .pretendard(.captionL12)
            $0.textColor = .white
            $0.text = "|"
        }

        totalLabel.do {
            $0.font = .pretendard(.captionL10)
            $0.textColor = .white
        }

        hStack.do {
            $0.spacing = 2
            $0.axis = .horizontal
            $0.alignment = .center
        }
    }

    private func setUI() {
        addSubview(hStack)
        hStack.addArrangedSubviews(
            currentLabel,
            separatorLabel,
            totalLabel
        )
    }

    private func setLayout() {
        hStack.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.verticalEdges.equalToSuperview().inset(1)
        }
    }

    func configure(current: Int, total: Int) {
        currentLabel.text = "\(current)"
        totalLabel.text = "\(total)"
    }
}
