//
//  TopNavigationBar.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/19/25.
//

import UIKit

protocol TopNavigationBarDelegate: AnyObject {
    func backButtonDidTap()
}

final class TopNavigationBar: BaseView {
    private let backButton = UIButton()
    private let searchButton = UIButton()
    private let cartButton = UIButton()
    
    override func setUI() {
        [backButton, searchButton, cartButton].forEach {
            addSubview($0)
        }
    }
    
    override func setStyle() {
        backgroundColor = .white
        backButton.do {
            $0.setImage(.back, for: .normal)
        }
        
        searchButton.do {
            $0.setImage(.search, for: .normal)
        }
        
        cartButton.do {
            $0.setImage(.cart, for: .normal)
        }
    }
    
    override func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(58)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(22)
        }
        
        searchButton.snp.makeConstraints {
            $0.trailing.equalTo(cartButton.snp.leading).offset(-16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(22)
        }
        
        cartButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(22)
        }
    }
}

