//
//  Item.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/20/25.
//

struct Item {
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
    .init(
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
    .init(
        imageUrl: "outer2",
        colors: ["#1A1A1A", "#DDDDDD"],
        gender: "MEN",
        size: "S~XL",
        itemName: "경량 패딩 자켓",
        originalPrice: 59900,
        salePrice: nil,
        tagText: nil,
        rating: 4.5,
        reviewCount: 132
    ),
    .init(
        imageUrl: "outer3",
        colors: ["#3A3A3A"],
        gender: "WOMEN",
        size: "XS~L",
        itemName: "코지 후리스 집업",
        originalPrice: 39900,
        salePrice: 29900,
        tagText: "한정특가",
        rating: 4.7,
        reviewCount: 89
    ),
    .init(
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
    .init(
        imageUrl: "outer2",
        colors: ["#1A1A1A", "#DDDDDD"],
        gender: "MEN",
        size: "S~XL",
        itemName: "경량 패딩 자켓",
        originalPrice: 59900,
        salePrice: nil,
        tagText: nil,
        rating: 4.5,
        reviewCount: 132
    ),
    .init(
        imageUrl: "outer3",
        colors: ["#3A3A3A"],
        gender: "WOMEN",
        size: "XS~L",
        itemName: "코지 후리스 집업",
        originalPrice: 39900,
        salePrice: 29900,
        tagText: "한정특가",
        rating: 4.7,
        reviewCount: 89
    ),
    .init(
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
    .init(
        imageUrl: "outer2",
        colors: ["#1A1A1A", "#DDDDDD"],
        gender: "MEN",
        size: "S~XL",
        itemName: "경량 패딩 자켓",
        originalPrice: 59900,
        salePrice: nil,
        tagText: nil,
        rating: 4.5,
        reviewCount: 132
    ),
    .init(
        imageUrl: "outer3",
        colors: ["#3A3A3A"],
        gender: "WOMEN",
        size: "XS~L",
        itemName: "코지 후리스 집업",
        originalPrice: 39900,
        salePrice: 29900,
        tagText: "한정특가",
        rating: 4.7,
        reviewCount: 89
    )
]
