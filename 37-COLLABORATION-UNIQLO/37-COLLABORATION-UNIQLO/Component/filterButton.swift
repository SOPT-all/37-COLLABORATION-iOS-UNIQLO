//
//  filterButton.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/17/25.
//

import UIKit

enum FilterType: String, CaseIterable {
    case reset
    case popularity
    case category
    case price
    case color
    
    var title: String {
        switch self {
            case .reset: return "초기화"
            case .popularity: return "인기순"
            case .category: return "카테고리"
            case .price: return "가격"
            case .color: return "색상"
        }
    }
    
}

final class filterButton : UIButton {
    private let type: FilterType
    
    init(type: FilterType){
        self.type = type
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        //버튼 스타일 공통
        clipsToBounds = true
        layer.cornerRadius = 21
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "gray300")?.cgColor
        
        //타입에 맞는 이미지 적용
//        setImage(type.buttonImage, for: .normal)
        
        contentEdgeInsets = UIEdgeInsets(top: 6, left: 14, bottom: 6, right: 31)
        imageEdgeInsets = UIEdgeInsets(top: 9, left: 50, bottom: 9, right: 14)
        
        //아이콘을 오른쪽에 고정
        semanticContentAttribute = .forceRightToLeft
    }
    
    
    
    
}
