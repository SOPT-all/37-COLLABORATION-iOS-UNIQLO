//
//  ProductListResponseDTO.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/25/25.
//

struct ProductListDTO: Codable {
    let productImageUrl: String
    let colorCode: [String]
    let genderAndSizeRange: String
    let name: String
    let originPrice: String
    let salePrice: String?
    let productType: String?
    let starAverage: Double
    let reviewCount: Int
}

extension ProductListDTO {
    func toItem() -> Item {

        func parsePrice(_ text: String?) -> Int? {
            guard let text else { return nil }
            let digitsOnly = text.filter {
                $0.isNumber
            }
            return Int(digitsOnly)
        }
        
        let origin = parsePrice(originPrice) ?? 0
        let sale = parsePrice(salePrice)
        
        let parts = genderAndSizeRange
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
        
        let gender = parts.first.map { substring in
            return String(substring)
        } ?? ""
        let size   = parts.dropFirst().joined(separator: ", ")
        
        return Item(
            imageUrl: productImageUrl,
            colors: colorCode,
            gender: gender,
            size: size,
            itemName: name,
            originalPrice: origin,
            salePrice: sale,
            tagText: productType,
            rating: Double(starAverage),
            reviewCount: reviewCount
        )
    }
}
