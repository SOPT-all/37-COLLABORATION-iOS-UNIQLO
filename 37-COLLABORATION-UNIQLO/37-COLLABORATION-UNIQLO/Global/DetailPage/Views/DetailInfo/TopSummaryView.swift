//
//  TopSummaryView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class TopSummaryView: BaseView {
    private let titleLabel = UILabel()
    private let photoView = UIImageView()
    private let summaryLabel = UILabel()

    override func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.bodySb13)
            $0.textColor = .black
            $0.text = "제품 상세"
        }

        photoView.do {
            $0.contentMode = .scaleAspectFill
            $0.image = .outer2
        }

        summaryLabel.do {
            $0.font = .pretendard(.captionR12)
            $0.textColor = .black
            $0.numberOfLines = 0
            $0.setTextWithLineHeight(
                "적당히 탄탄함이 느껴지는 원단을 사용하였습니다.",
                lineHeight: $0.font.pointSize,
                indent: false
            )
        }
    }

    override func setUI() {
        addSubviews(titleLabel, photoView, summaryLabel)
    }

    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        photoView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(25)
            $0.leading.equalToSuperview()
            $0.size.equalTo(160)
            $0.bottom.equalToSuperview()
        }

        summaryLabel.snp.makeConstraints {
            $0.top.equalTo(photoView.snp.top)
            $0.leading.equalTo(photoView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(16)
        }
    }

    func configure(imageURL: String?, text: String) {
        summaryLabel.text = text
    }
}
