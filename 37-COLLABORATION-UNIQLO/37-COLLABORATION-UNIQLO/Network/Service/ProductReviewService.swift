//
//  ProductReviewService.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/26/25.
//

protocol ProductReviewService {
    func getProductReviews(productId: Int) async throws -> [ReviewModel]
}

final class DefaultProductReviewService: ProductReviewService {
    let network = NetworkService.shared
    
    func getProductReviews(productId: Int) async throws -> [ReviewModel] {
        do {
            let result: ProductReviewTopResponseDTO = try await network.request(endPoint: .reviews(productId))
            print(result)
            return result.toEntity()
        } catch {
            print("리뷰 조회 실패 \(error.localizedDescription)")
            throw error
        }
    }
}
