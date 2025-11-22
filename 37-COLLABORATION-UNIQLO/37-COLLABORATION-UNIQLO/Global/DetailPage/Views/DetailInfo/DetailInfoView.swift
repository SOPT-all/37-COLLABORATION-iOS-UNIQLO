//
//  DetailInfoView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class DetailInfoView: BaseView {
    private let titleLabel = UILabel()
    private var stackViews: [UIStackView] = []
    private let detailFeatureLabel = UILabel()
    private let sizeLabel = UILabel()
    private let sizeInfoLabel = UILabel()
    private let tailLabel = UILabel()
    
    private var contents = UIStackView()
    
    override func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.bodySb13)
            $0.textColor = .black
            $0.text = "제품 상세 설명"
        }

        detailFeatureLabel.do {
            $0.font = .pretendard(.bodyR15)
            $0.textColor = .black
            $0.text = "기능 세부정보"
        }

        sizeLabel.do {
            $0.font = .pretendard(.bodyR15)
            $0.textColor = .black
            $0.text = "사이즈"
        }

        sizeInfoLabel.do {
            $0.font = .pretendard(.bodyR13)
            $0.textColor = .black
            $0.text = "상단표시"
        }

        tailLabel.do {
            $0.font = .pretendard(.bodyR13)
            $0.textColor = .black
            $0.setTextWithLineHeight(
                "이 제품은 동일 제품이라도 Tag에 기재된 제품 정보가 다른 경우가 있습니다. 양해 부탁 드리겠습니다.",
                lineHeight: $0.font.pointSize,
                indent: false
            )
            $0.numberOfLines = 0
        }
        
        contents.do {
            $0.spacing = 26
            $0.axis = .vertical
        }
    }
    
    override func setUI() {
        addSubviews(titleLabel, contents, tailLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        contents.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
        }

        tailLabel.snp.makeConstraints {
            $0.top.equalTo(contents.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    func configure(items: DetailData) {
        contents.arrangedSubviews.forEach { sub in
            contents.removeArrangedSubview(sub)
            sub.removeFromSuperview()
        }
        
        let detailStack = UIStackView().then {
            $0.spacing = 6
            $0.axis = .vertical
        }
        detailStack.addArrangedSubviews(
            detailFeatureLabel,
            makeInfoStackView(
                info: items.featureDetailText,
                marker: .minus
            )
        )
        
        let sizeStack = UIStackView().then {
            $0.spacing = 10
            $0.axis = .vertical
        }
        sizeStack.addArrangedSubviews(sizeLabel, sizeInfoLabel)
        
        contents.addArrangedSubviews(
            makeInfoStackView(
                info: items.descriptionText,
                marker: .bullet
            ),
            detailStack,
            sizeStack,
            makeInfoStackView(
                info: items.sizeDetailText,
                marker: .bullet
            )
        )
    }

    private func makeInfoStackView(
        info: [String],
        marker: Marker
    ) -> UIStackView {
        let stack = UIStackView().then {
            $0.axis = .vertical
            $0.alignment = .leading
        }

        info.forEach { text in
            let combined = "\(marker.rawValue) \(text)"
            let label = UILabel().then {
                $0.numberOfLines = 0
                $0.font = .pretendard(.bodyR13)
                $0.textColor = .black
                $0.setTextWithLineHeight(combined, lineHeight: $0.font.pointSize)
            }
            stack.addArrangedSubview(label)
        }
        return stack
    }
}

extension DetailInfoView {
    private enum Marker: String {
        case bullet = "•"
        case minus = "-"
    }
}
