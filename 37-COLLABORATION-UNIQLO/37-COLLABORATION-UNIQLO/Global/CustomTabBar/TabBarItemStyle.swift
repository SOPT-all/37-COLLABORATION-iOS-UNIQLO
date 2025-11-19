//
//  TabBarItem.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/18/25.
//

import UIKit

enum TabBarItemStyle: Int {
    case home
    case category
    case wishlist
    case mypage
    
    var normalImage: UIImage {
        switch self {
        case .home:
            return .home
        case .category:
            return .category
        case .wishlist:
            return .wish
        case .mypage:
            return .mypage
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .home:
            return .homeSelected
        case .category:
            return .categorySelected
        case .wishlist:
            return .wishSelected
        case .mypage:
            return .mypageSelected
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .category:
            return "카테고리"
        case .wishlist:
            return "위시리스트"
        case .mypage:
            return "마이페이지"
        }
    }
}

struct TabBarItemView {
    let container: UIView
    let imageView: UIImageView
    let titleLabel: UILabel
}
