//
//  ReviewSummaryView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class ReviewSummaryView: BaseView {
    private let starView = UIStackView()
    private let averageRateLabel = UILabel()
    private let commentNumberLabel = UILabel()

    private let contents = UIStackView()

    override func setStyle() {
        starView.do {
            $0.axis = .horizontal
        }

        averageRateLabel.do {
            $0.font = .pretendard(.bodySb15)
            $0.textColor = .black
            $0.text = "4.8"
        }

        commentNumberLabel.do {
            $0.font = .pretendard(.bodyR13)
            $0.textColor = .blueMain
            $0.text = "(24)"
        }

        contents.do {
            $0.spacing = 4
            $0.axis = .horizontal
        }
    }

    override func setUI() {
        addSubview(contents)
        (0..<5).forEach { _ in
            starView.addArrangedSubview(star())
        }
        contents.addArrangedSubviews(
            starView,
            averageRateLabel,
            commentNumberLabel
        )
    }

    override func setLayout() {
        contents.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func star() -> UIImageView {
        let star = UIImageView().then {
            $0.image = .starFilled
        }
        star.snp.makeConstraints {
            $0.width.height.equalTo(18)
        }
        return star
    }
}

extension ReviewSummaryView {
    func configure(rate: Float = 4.8, commentNum: Int = 24) {
        averageRateLabel.text = "\(rate)"
        commentNumberLabel.text = "(\(commentNum))"
    }
}
