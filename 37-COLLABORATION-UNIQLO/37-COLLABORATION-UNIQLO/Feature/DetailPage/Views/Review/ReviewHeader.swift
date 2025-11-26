//
//  ReviewHeader.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class ReviewHeader: BaseView {
    private let titleLabel = UILabel()
    private let reviewButton = IconTextButton(icon: .review, text: "리뷰 작성")
    private let reviewSummaryView = ReviewSummaryView()
    private let sizeView = UIImageView()

    override func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.titleR20)
            $0.textColor = .black
            $0.text = "리뷰"
        }

        sizeView.do {
            $0.image = .sizeAvg
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            reviewButton,
            reviewSummaryView,
            sizeView
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        reviewButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }

        reviewSummaryView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview()
        }

        sizeView.snp.makeConstraints {
            $0.top.equalTo(reviewSummaryView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configure(rate: Float, reviewCount: Int) {
        reviewSummaryView.configure(rate: rate, commentNum: reviewCount)
    }
}
