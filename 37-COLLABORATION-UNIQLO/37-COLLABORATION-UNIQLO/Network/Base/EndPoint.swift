//
//  EndPoint.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/20/25.
//

import Foundation

enum EndPoint {
    case products // 세부 카테고리에 해당하는 제품 조회
    case productID(Int) // 제품 정보 조회
    case detail(Int) ///제품 상세 조회
    case hint(Int) // 제품 stylehint 조회
    case reviews(Int) // 제품 리뷰 조회
    
    var requestType: HTTPMethodType {
        switch self {
        case .products, .productID, .detail, .hint, .reviews:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .products:
            return "/api/v1/products"
        case .productID(let productId):
            return "/api/v1/products/\(productId)"
        case .detail(let productId):
            return "/api/v1/products/\(productId)/details"
        case .hint(let productId):
            return "/api/v1/products/\(productId)/hints"
        case .reviews(let productId):
            return "/api/v1/products/\(productId)/reviews"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .products, .productID, .detail, .hint, .reviews:
            return HeaderType.basic.value
        }
    }
}
