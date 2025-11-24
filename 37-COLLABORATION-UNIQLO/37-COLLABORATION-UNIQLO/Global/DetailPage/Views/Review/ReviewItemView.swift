//
//  ReviewItemView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class ReviewItemView: BaseView {
    
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let starView = UIStackView()
    private let optionStackView = UIStackView()
    private let commentLabel = UILabel()
    private let userInfoLabel = UILabel()
    private let reportButton = IconTextButton(icon: .report, text: "신고하기")
    private let helpButton = HelpButton()
    
    private let contentStack = UIStackView()
    
    override func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.bodyR15)
            $0.textColor = .black
            $0.text = "리뷰"
            $0.numberOfLines = 0
        }
        
        dateLabel.do {
            $0.font = .pretendard(.captionR12)
            $0.textColor = .gray300
        }
        
        starView.do {
            $0.axis = .horizontal
        }
        
        optionStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .leading
        }
        
        commentLabel.do {
            $0.font = .pretendard(.bodyR13)
            $0.textColor = .gray900
            $0.numberOfLines = 0
        }

        userInfoLabel.do {
            $0.font = .pretendard(.captionR12)
            $0.textColor = .gray300
            $0.numberOfLines = 0
        }
        
        contentStack.do {
            $0.axis = .vertical
            $0.alignment = .leading
        }
    }
    
    override func setUI() {
        addSubviews(
            contentStack,
            dateLabel,
            reportButton,
            helpButton
        )

        contentStack.addArrangedSubviews(
            titleLabel,
            starView,
            optionStackView,
            commentLabel,
            userInfoLabel,
        )
    }
    
    override func setLayout() {
        contentStack.setCustomSpacing(18, after: titleLabel)
        contentStack.setCustomSpacing(4, after: starView)
        contentStack.setCustomSpacing(13, after: optionStackView)
        contentStack.setCustomSpacing(19, after: commentLabel)
        
        contentStack.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
    
        dateLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }
        
        reportButton.snp.makeConstraints {
            $0.trailing.equalTo(helpButton.snp.leading).offset(-5)
            $0.bottom.equalTo(helpButton)
        }

        helpButton.snp.makeConstraints {
            $0.top.equalTo(contentStack.snp.bottom).offset(21)
            $0.trailing.bottom.equalToSuperview().inset(6)
        }
    }
    
}

extension ReviewItemView {
    func configure(with model: ReviewModel) {
        titleLabel.text = model.title
        dateLabel.text = model.date
        
        updateStarView(num: model.star)
        configureOptions(size: model.size, color: model.color, fit: model.fit)

        commentLabel.text = model.content
        userInfoLabel.text = model.genderAndHeight
        
        helpButton.configure(count: model.recommend)
    }
    
    private func configureOptions(size: String, color: String, fit: String) {
        optionStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        let options: [ProductOption] = [
            .size(size),
            .color(color),
            .fit(fit)
        ]

        options.forEach { option in
            let label = UILabel().then {
                $0.attributedText = option.attributedText()
            }
            optionStackView.addArrangedSubview(label)
        }
    }

    private func updateStarView(num: Int) {
        starView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        (1...num).forEach { _ in
            starView.addArrangedSubview(star())
        }
    }
    
    private func star() -> UIImageView {
        let star = UIImageView().then {
            $0.image = .starFilled
        }
        star.snp.makeConstraints {
            $0.size.equalTo(18)
        }
        return star
    }
}

extension ReviewItemView {

    enum ProductOption {
        case size(String)
        case color(String)
        case fit(String)

        var title: String {
            switch self {
            case .size: return "구매 사이즈"
            case .color: return "구매 색상"
            case .fit: return "착용감"
            }
        }

        private var value: String {
            switch self {
            case let .size(v), let .color(v), let .fit(v):
                return v
            }
        }

        func attributedText() -> NSAttributedString {
            let attr = NSMutableAttributedString(
                string: "\(title): ",
                attributes: [
                    .font: UIFont.pretendard(.captionM12),
                    .foregroundColor: UIColor.gray600
                ]
            )
            let valueAttr = NSAttributedString(
                string: value,
                attributes: [
                    .font: UIFont.pretendard(.bodyR13),
                    .foregroundColor: UIColor.gray600
                ]
            )
            attr.append(valueAttr)
            return attr
        }
    }

}
