//
//  SideTableViewCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/21/25.
//

import UIKit

class SideTableViewCell: UITableViewCell {

    private let itemLabel = UILabel()
    private var isItemSelected: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubviews(itemLabel)
    }
    
    private func setStyle() {
        self.do {
            $0.backgroundColor = .gray100
            $0.layer.borderWidth = 0
        }
        
        itemLabel.do {
            $0.font = .pretendard(.bodyR13)
            $0.textColor = .gray600
        }
    }
    
    private func setLayout() {
        itemLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(19)
        }
    }
    
    private func updateUI() {
        self.do {
            $0.backgroundColor = isItemSelected ? .white : .gray100
        }
        
        itemLabel.do {
            $0.font = isItemSelected ? .pretendard(.bodySb13) : .pretendard(.bodyR13)
            $0.textColor = .gray600
        }
    }
}

extension SideTableViewCell {
    func bind(with item: String, isSelected: Bool) {
        itemLabel.text = item
        self.isItemSelected = isSelected
    }
}
