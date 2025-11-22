//
//  PurchaseSupportView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class PurchaseSupportView: BaseView {
    
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let orderStatusInfoButton = UIButton()
    private let exchangeReturnInfoButton = UIButton()
    private let inquiryButton = IconTextButton(icon: .inquiry, text: "문의하기")

    private let vStack = UIStackView()

    override func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.bodySb13)
            $0.textColor = .black
            $0.text = "배송 / 결제 / 교환 / 반품"
        }
        
        messageLabel.do {
            $0.font = .pretendard(.bodyR15)
            $0.textColor = .black
            $0.text = "상세 정보는 각 링크에서 확인 부탁 드립니다."
        }

        orderStatusInfoButton.do {
            $0.setTitle("배송 / 결제 정보", for: .normal)
            $0.setTitleColor(.blueMain, for: .normal)
            $0.titleLabel?.font = .pretendard(.bodyR13)
        }

        exchangeReturnInfoButton.do {
            $0.setTitle("교환 / 반품 안내", for: .normal)
            $0.setTitleColor(.blueMain, for: .normal)
            $0.titleLabel?.font = .pretendard(.bodyR13)
        }
        
        vStack.do {
            $0.axis = .vertical
            $0.alignment = .leading
        }
    }
    
    override func setUI() {
        addSubviews(vStack, inquiryButton)
        vStack.addArrangedSubviews(
            titleLabel,
            messageLabel,
            orderStatusInfoButton,
            exchangeReturnInfoButton
        )
    }
    
    override func setLayout() {
        vStack.setCustomSpacing(20, after: titleLabel)
        vStack.setCustomSpacing(5, after: messageLabel)
        
        vStack.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
        }
        inquiryButton.snp.makeConstraints {
            $0.top.equalTo(vStack.snp.bottom).offset(3)
            $0.height.equalTo(34)
            $0.trailing.bottom.equalToSuperview()
        }
    }
}
