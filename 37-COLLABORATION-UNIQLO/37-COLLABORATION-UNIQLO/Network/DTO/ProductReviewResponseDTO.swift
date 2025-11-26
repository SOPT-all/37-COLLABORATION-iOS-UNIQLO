//
//  ProductReviewResponseDTO.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/26/25.
//

import Foundation

struct ProductReviewTopResponseDTO: Decodable {
    let reviews: [ProductReviewResponseDTO]
}

struct ProductReviewResponseDTO: Decodable {
    let title: String
    let content: String
    let star: Int
    let createdAt: String
    let height: String
    let gender: String
    let recommend: Int
    let size: String
    let color: String
    let fit: String
}

extension ProductReviewTopResponseDTO {
    func toEntity() -> [ReviewModel] {
        return reviews.map { dto in
            ReviewModel(
                title: dto.title,
                star: dto.star,
                size: dto.size,
                color: dto.color,
                fit: dto.fit,
                content: dto.content,
                genderAndHeight: "\(dto.gender) · \(dto.height)",
                recommend: dto.recommend,
                date: dto.createdAt
            )
        }
    }
}
