//
//  CategoryModel.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/21/25.
//

import Foundation
import UIKit

struct CategoryItemModel {
    let item: String
    
    static let mockData: [CategoryItemModel] = [
        CategoryItemModel(item: "신발"),
        CategoryItemModel(item: "아우터"),
        CategoryItemModel(item: "팬츠"),
        CategoryItemModel(item: "스커트"),
        CategoryItemModel(item: "원피스"),
        CategoryItemModel(item: "이너웨어"),
        CategoryItemModel(item: "홈웨어"),
        CategoryItemModel(item: "액세서리"),
        CategoryItemModel(item: "히트텍"),
        CategoryItemModel(item: "에어리즘"),
        CategoryItemModel(item: "스포츠"),
        CategoryItemModel(item: "UT"),
        CategoryItemModel(item: "콜라보"),
        CategoryItemModel(item: "브랜드"),
        CategoryItemModel(item: "이벤트")
    ]
}

struct OuterItemModel {
    let item: String
    let image: UIImage
    
    static let mockData: [OuterItemModel] = [
        OuterItemModel(item: "경량 패딩 (PUFFTECH)", image: .outer1),
        OuterItemModel(item: "파카 & 블루종 & 후리스", image: .outer2),
        OuterItemModel(item: "재킷 & 블레이저", image: .outer3),
        OuterItemModel(item: "코트", image: .outer4),
        OuterItemModel(item: "다운 & 패딩", image: .outer5)
    ]
}
