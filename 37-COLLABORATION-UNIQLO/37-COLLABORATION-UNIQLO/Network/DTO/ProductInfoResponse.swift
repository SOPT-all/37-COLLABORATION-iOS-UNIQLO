//
//  ProductInfoResponse.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/25/25.
//

import UIKit

struct ProductInfoResponse: Decodable {
    let productId: String
    let productImageUrl: [URL]
    let colorCode: [String]
    let color: [String: String]
    let name: String
    let originPrice: String
    let starAverage: Float
    let reviewCount: Int
}
