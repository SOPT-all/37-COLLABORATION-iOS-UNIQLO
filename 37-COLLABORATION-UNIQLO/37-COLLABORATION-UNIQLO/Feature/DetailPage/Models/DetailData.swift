//
//  DetailData.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

struct DetailData {
    let detailImageUrl: String?
    let detailText: String
    let descriptionText: [String]
    let featureDetailText: [String]
    let sizeDetailText: [String]
    
    static let MockData = DetailData(
        detailImageUrl: nil,
        detailText: "",
        descriptionText: [
            "가디건처럼 걸쳐 입기 좋습니다.",
            "소프 기장으로 클린한 룩은 물론 캐주얼한 특으로도 연출할 수 있습니다."
        ],
        featureDetailText: [
            "비침: 없음",
            "맞: 보통 맞(레귤러)",
            "포켓(주머니): 있음"
        ],
        sizeDetailText: [
            "계제된 이미지에는 판매 예정이 없는 컬러가 포함되어 있을 수 있습니다.",
            "취급 정포에 따라 상품의 표정 및 판매일 변경 될 수 있습니다.",
            "모니터사양에 따라 상품의 색상 및 무늬 등이 실제 상품과 다소 차이 날 수 있습니다.",
            "XS, XXL, 3XL 사이즈는 온라인 스토어에서만 판매합니다."
        ]
    )
}
