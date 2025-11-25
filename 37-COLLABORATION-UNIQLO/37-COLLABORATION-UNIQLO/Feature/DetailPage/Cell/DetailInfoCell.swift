//
//  DetailInfoCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class DetailInfoCell: UITableViewCell {
    private let topSummaryView = TopSummaryView()
    private let detailInfoView = DetailInfoView()
    private let purchaseSupportView = PurchaseSupportView()
    private let containerStack = UIStackView()

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
        containerStack.do {
            $0.spacing = 18
            $0.axis = .vertical
        }
    }

    private func setUI() {
        contentView.addSubview(containerStack)
        containerStack.addArrangedSubviews(
            topSummaryView,
            UnderLineView(),
            detailInfoView,
            UnderLineView(),
            purchaseSupportView
        )
    }
    
    private func setLayout() {
        containerStack.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.verticalEdges.equalToSuperview().inset(30)
        }
    }

    func configure(with data: ProductDetailResponse? = nil) {
        guard let data else { return }
        topSummaryView.configure(
            imageURL: data.detailImageUrlList,
            text: data.detailText
        )
        detailInfoView.configure(items: data)
    }
}
