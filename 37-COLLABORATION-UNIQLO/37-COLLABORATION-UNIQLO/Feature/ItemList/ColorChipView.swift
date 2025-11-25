//
//  ColorChipView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/21/25.
//
import UIKit
import SnapKit

final class ColorChipView: UIView {
    
    init(color: UIColor) {
        super.init(frame: .zero)
        backgroundColor = color
        layer.borderColor = UIColor.gray600.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        clipsToBounds = true
        
        snp.makeConstraints {
            $0.size.equalTo(19)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
