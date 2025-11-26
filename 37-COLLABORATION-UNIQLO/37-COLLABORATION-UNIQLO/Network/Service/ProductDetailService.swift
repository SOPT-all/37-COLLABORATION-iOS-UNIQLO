//
//  ProductDetailService.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/22/25.
//

protocol ProductDetailService {
    func getProductDetails(productID: Int) async throws -> ProductDetailResponse
}

final class DefaultProductDetailService: ProductDetailService {
    let network = NetworkService.shared
    
    func getProductDetails(productID: Int) async throws -> ProductDetailResponse {
        do {
            let result: ProductDetailResponse = try await network.request(endPoint: .detail(productID))
            return result
        } catch {
            print("네트워크 요청 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
