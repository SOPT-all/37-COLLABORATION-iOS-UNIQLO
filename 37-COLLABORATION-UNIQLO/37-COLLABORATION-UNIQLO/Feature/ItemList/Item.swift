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
