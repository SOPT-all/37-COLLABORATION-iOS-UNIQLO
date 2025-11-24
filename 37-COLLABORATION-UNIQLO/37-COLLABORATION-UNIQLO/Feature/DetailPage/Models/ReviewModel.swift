//
//  ReviewModel.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

struct ReviewModel {
    let title: String
    let star: Int
    let size: String
    let color: String
    let fit: String
    let content: String
    let genderAndHeight: String
    let recommend: Int
    let date: String

    static let MockData: [ReviewModel] = [
        ReviewModel(
            title: "만족스러운 퀄리티!",
            star: 5,
            size: "L",
            color: "블랙",
            fit: "정사이즈",
            content: "재질 좋고 핏도 너무 잘 맞아요. 가격 대비 훌륭합니다.",
            genderAndHeight: "남성 · 178cm",
            recommend: 32,
            date: "2025.01.11"
        ),
        ReviewModel(
            title: "기대보다 평범함",
            star: 3,
            size: "M",
            color: "그레이",
            fit: "조금 큼",
            content: "입을 만은 한데 특별한 느낌은 없어요.",
            genderAndHeight: "여성 · 162cm",
            recommend: 8,
            date: "2025.01.08"
        )
    ]
}
