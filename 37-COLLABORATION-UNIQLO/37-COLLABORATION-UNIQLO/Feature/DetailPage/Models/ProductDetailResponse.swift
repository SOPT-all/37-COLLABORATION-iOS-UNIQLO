//
//  ProductDetailResponse.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

struct ProductDetailResponse: Decodable {
    let detailImageUrlList: [String]
    let detailText: String
    let descriptionTextList: [String]
    let featureDetailTextList: [String]
    let sizeDetailTextList: [String]
}
