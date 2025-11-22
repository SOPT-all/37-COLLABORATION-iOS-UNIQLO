//
//  DivideBarCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit

final class DivideBarCell: UITableViewCell {
    private let bar = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        bar.do {
            $0.backgroundColor = .gray100
        }
    }

    func setUI() {
        addSubview(bar)
    }

    func setLayout() {
        bar.snp.makeConstraints {
            $0.height.equalTo(10)
            $0.edges.equalToSuperview()
        }
    }
}
