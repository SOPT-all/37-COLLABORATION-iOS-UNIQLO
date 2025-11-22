//
//  DetailBottomBar.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class DetailBottomBar: BaseView {
    private let underLineBar = UnderLineView()
    private let heartButton = IconCircleButton(type: .heart)
    private let cartButton = UIButton()

    override func setStyle() {
        cartButton.do {
            $0.layer.cornerRadius = 25
            $0.titleLabel?.font = .pretendard(.bodyR15)
            $0.setTitle("장바구니에 담기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .black
        }
    }
    
    override func setUI() {
        addSubviews(underLineBar, heartButton, cartButton)
    }
    
    override func setLayout() {
        underLineBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }

        heartButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(6)
        }

        cartButton.snp.makeConstraints {
            $0.top.equalTo(heartButton)
            $0.leading.equalTo(heartButton.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(46)
        }
    }
}
