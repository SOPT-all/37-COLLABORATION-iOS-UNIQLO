//
//  ProductInfoService.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/25/25.
//

protocol ProductInfoService {
    func getProductInfo(productID: Int) async throws -> ProductInfoResponse
}

final class DefaultProductInfoService: ProductInfoService {
    let network = NetworkService.shared
    
    func getProductInfo(productID: Int) async throws -> ProductInfoResponse {
        do {
            let result: ProductInfoResponse = try await network.request(endPoint: .productID(productID))
            return result
        } catch {
            print("네트워크 요청 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
