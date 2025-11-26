//
//  ProductStyleHintService.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/26/25.
//

protocol ProductStyleHintService {
    func getStyleHints(productId: Int) async throws -> [String]
}

final class DefaultStyleHintService: ProductStyleHintService {
    
    private let network = NetworkService.shared
    
    func getStyleHints(productId: Int) async throws -> [String] {
        do {
            let urls: StyleHintResponseDTO = try await network.request(endPoint: .hint(productId))
            return urls.styleHintImageUrlList
        } catch {
            print("네트워크 요청 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
