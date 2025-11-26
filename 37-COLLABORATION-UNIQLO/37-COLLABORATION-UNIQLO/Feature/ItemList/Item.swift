//
//  Item.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/20/25.
//

struct Item {
    let productId: Int
    let imageUrl: String
    let colors: [String] //#hex
    let gender: String
    let size: String
    let itemName: String
    let originalPrice: Int
    let salePrice: Int?
    let tagText: String?
    let rating: Double
    let reviewCount: Int
}

let mockItems: [Item] = [
    Item(productId: 1,
        imageUrl: "outer1",
        colors: ["#2F2F2F", "#B5B5B5"],
        gender: "WOMEN",
        size: "XS~XL",
        itemName: "더블브레스트 테일러드 재킷",
        originalPrice: 89900,
        salePrice: 79900,
        tagText: "온라인단독",
        rating: 4.8,
        reviewCount: 21
    ),
    Item(productId: 2,
        imageUrl: "outer1",
        colors: ["#2F2F2F", "#B5B5B5"],
        gender: "WOMEN",
        size: "XS~XL",
        itemName: "더블브레스트 테일러드 재킷",
        originalPrice: 89900,
        salePrice: 79900,
        tagText: "온라인단독",
        rating: 4.8,
        reviewCount: 21
    ),
    Item(productId: 3,
        imageUrl: "outer1",
        colors: ["#2F2F2F", "#B5B5B5"],
        gender: "WOMEN",
        size: "XS~XL",
        itemName: "더블브레스트 테일러드 재킷",
        originalPrice: 89900,
        salePrice: 79900,
        tagText: "온라인단독",
        rating: 4.8,
        reviewCount: 21
    ),
    Item(productId: 4,
        imageUrl: "outer1",
        colors: ["#2F2F2F", "#B5B5B5"],
        gender: "WOMEN",
        size: "XS~XL",
        itemName: "더블브레스트 테일러드 재킷",
        originalPrice: 89900,
        salePrice: 79900,                 
        tagText: "온라인단독",
        rating: 4.8,
        reviewCount: 21
    )
]
