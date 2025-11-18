//
//  UIFont+.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/16/25.
//

import UIKit

extension UIFont {
    enum PretendardFont: String {
        case semibold = "Pretendard-Semibold"
        case medium = "Pretendard-Medium"
        case regular = "Pretendard-Regular"
        case light = "Pretendard-Light"
    }
    enum RedditFont: String {
        case semibold = "RedditSansCondensed-Semibold"
        case medium = "RedditSansCondensed-Medium"
        case regular = "RedditSansCondensed-Regular"
    }
}

extension UIFont {
    static func pretendard(_ style: FontManager.Pretendard) -> UIFont {
        let config = style.config
        return UIFont(name: config.font.rawValue, size: config.size) ?? UIFont()
    }

    static func reddit(_ style: FontManager.Reddit) -> UIFont {
        let config = style.config
        return UIFont(name: config.font.rawValue, size: config.size) ?? UIFont()
    }
}


