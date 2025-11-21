//
//  FilterButton.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/17/25.
//

import UIKit

enum FilterType: String {
    case reset
    case popularity
    case category
    case price
    case color
    
    var title: String {
        switch self {
            
        case .reset:
            return "초기화"
        case .popularity:
            return "인기순"
        case .category:
            return "카테고리"
        case .price:
            return "가격"
        case .color:
            return "색상"
            
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .reset: return UIImage(named: "reset")
        case .popularity, .category, .price, .color: return UIImage(named: "drop")
        }
    }
}

final class FilterButton: UIButton {
    private let type: FilterType
    private let gap: CGFloat = 9
    
    init(type: FilterType) {
        self.type = type
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = true
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "gray300")?.cgColor
        
        setTitle(type.title, for: .normal)
        setTitleColor(.gray900, for: .normal)
        titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 12)
        setImage(type.icon, for: .normal)
        
        contentEdgeInsets = UIEdgeInsets(top: 6, left: 18, bottom: 6, right: 20)
        
        semanticContentAttribute = .forceRightToLeft
        
        titleEdgeInsets = UIEdgeInsets(
            top: 0, left: -gap/2, bottom: 0, right: gap/2
        )
        imageEdgeInsets = UIEdgeInsets(
            top: 0, left: gap/2, bottom: 0, right: -gap/2
        )
    }
    
}
