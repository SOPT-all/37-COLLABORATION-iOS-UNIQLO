//
//  UnderLineView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

final class UnderLineView: BaseView {
    override func setStyle() {
        backgroundColor = .gray200
    }
    
    override func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(1)
        }
    }
}
