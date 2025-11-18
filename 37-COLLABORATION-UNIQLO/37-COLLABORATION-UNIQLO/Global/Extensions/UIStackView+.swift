//
//  UIStackView+.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/18/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
