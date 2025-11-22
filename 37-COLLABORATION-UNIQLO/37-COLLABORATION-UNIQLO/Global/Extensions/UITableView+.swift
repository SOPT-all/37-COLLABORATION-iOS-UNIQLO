//
//  UITableView+.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

extension UITableView {
    func register(_ cells: UITableViewCell.Type...) {
        cells.forEach {
            self.register($0, forCellReuseIdentifier: $0.identifier)
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}
