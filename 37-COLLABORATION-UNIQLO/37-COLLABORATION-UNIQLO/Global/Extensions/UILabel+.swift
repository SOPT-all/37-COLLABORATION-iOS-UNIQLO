//
//  UILabel+.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

extension UILabel {

    func setTextWithLineHeight(
        _ text: String,
        lineHeight: CGFloat,
        multiple: CGFloat = 1.5,
        indent: Bool = true
    ) {
        let lineHeight = lineHeight * multiple
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.alignment = self.textAlignment

        if indent {
            paragraphStyle.headIndent = 10
            paragraphStyle.firstLineHeadIndent = 0
            paragraphStyle.paragraphSpacing = 4
        }

        let attributes: [NSAttributedString.Key: Any] = [
            .font: self.font as Any,
            .foregroundColor: self.textColor as Any,
            .paragraphStyle: paragraphStyle
        ]
        
        self.attributedText = NSAttributedString(string: text, attributes: attributes)
    }

}
