//
//  ProductListService.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/22/25.
//

protocol ProductListService {
    func getProductList() async throws -> [Item]
}

final class DefaultProductListService: ProductListService {
    let network = NetworkService.shared
    
    func getProductList() async throws -> [Item] {
        do {
            let list: [ProductListDTO] = try await network.request(endPoint: .products)
            return list.map {
                $0.toItem()
            }
        } catch {
            print("네트워크 요청 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
