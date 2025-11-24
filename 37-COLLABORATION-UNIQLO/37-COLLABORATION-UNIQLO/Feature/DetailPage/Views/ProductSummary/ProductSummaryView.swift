//
//  ProductSummaryView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class ProductSummaryView: BaseView {

    private let nameLabel = UILabel()
    private let numberLabel = UILabel()
    private let colorLabel = UILabel()

    private let priceLabel = UILabel()
    private let wonLabel = UILabel()

    private let reviewSummaryView = ReviewSummaryView()
    private let colorSelectorView = ProductColorSelectorView()

    private let mainStackView = UIStackView()

    override func setStyle() {
        nameLabel.do {
            $0.font = .pretendard(.titleR20)
            $0.textColor = .black
        }

        numberLabel.do {
            $0.font = .pretendard(.bodyR13)
            $0.textColor = .gray600
        }

        colorLabel.do {
            $0.font = .pretendard(.captionR12)
            $0.textColor = .gray300
        }

        priceLabel.do {
            $0.font = .pretendard(.titleSb26)
            $0.textColor = .gray900
        }

        wonLabel.do {
            $0.font = .pretendard(.titleM24)
            $0.textColor = .gray900
            $0.text = "원"
        }
        
        mainStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
        }
    }

    override func setUI() {
        addSubviews(mainStackView, reviewSummaryView)

        let priceStack = UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 2
        }
        priceStack.addArrangedSubviews(priceLabel, wonLabel)

        mainStackView.addArrangedSubviews(
            nameLabel,
            numberLabel,
            colorLabel,
            colorSelectorView,
            priceStack
        )
        mainStackView.setCustomSpacing(8, after: nameLabel)
        mainStackView.setCustomSpacing(10, after: numberLabel)
        mainStackView.setCustomSpacing(12, after: colorLabel)
        mainStackView.setCustomSpacing(11, after: colorSelectorView)
    }

    override func setLayout() {
        mainStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(32)
        }

        reviewSummaryView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(32)
        }
    }

    func configure(
        name: String,
        number: String,
        colors: [ColorOption],
        price: String
    ) {
        nameLabel.text = name
        numberLabel.text = "제품번호: \(number)"
        priceLabel.text = price
        
        colorSelectorView.onColorSelected = { [weak self] option in
            self?.colorLabel.text = "컬러: \(option.name)"
        }
        colorSelectorView.configure(options: colors)
    }
}
