//
//  ReviewCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class ReviewCell: UITableViewCell {
    private let header = ReviewHeader()
    private let commentView1 = ReviewItemView()
    private let commentView2 = ReviewItemView()
    private let moreButton = UIButton(type: .system)
    
    private let container = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        moreButton.do {
            $0.setTitle("리뷰 더 보기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .pretendard(.bodyR13)
            $0.layer.borderColor = UIColor.gray200.cgColor
            $0.layer.borderWidth = 1
        }

        container.do {
            $0.axis = .vertical
            $0.spacing = 20
            $0.alignment = .fill
        }
    }
    
    private func setUI() {
        contentView.addSubview(container)
        container.addArrangedSubviews(
            header,
            UnderLineView(),
            commentView1,
            UnderLineView(),
            commentView2,
            moreButton
        )
    }
    
    private func setLayout() {
        container.setCustomSpacing(30, after: commentView2)
        container.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.verticalEdges.equalToSuperview().inset(20)
        }
        moreButton.snp.makeConstraints {
            $0.height.equalTo(37)
        }
    }
    
    func configure(items: [ReviewModel]) {
        commentView1.configure(with: items[0])
        commentView2.configure(with: items[1])
    }
}
