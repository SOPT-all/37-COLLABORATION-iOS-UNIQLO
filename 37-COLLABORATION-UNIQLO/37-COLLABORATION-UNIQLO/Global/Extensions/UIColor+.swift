//
//  UIColor+.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/20/25.
//
import UIKit

extension UIColor {
    convenience init?(hexString: String) {
        var string = hexString.replacingOccurrences(of: "#", with: "")
        
        if string.count == 3 {
            // #FFF -> #FFFFFF
            string = string.map { "\($0)\($0)" }.joined()
        }
        
        guard string.count == 6,
              let hex = Int(string, radix: 16) else { return nil }
        
        let r = CGFloat((hex >> 16) & 0xFF) / 255.0
        let g = CGFloat((hex >> 8) & 0xFF) / 255.0
        let b = CGFloat(hex & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
