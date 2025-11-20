//
//  CategoryTab.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/18/25.
//
import UIKit

import SnapKit
import Then

final class CategoryTabCell: UICollectionViewCell {
    static let identifier: String = "CategoryTabCell"
    
    // MARK: - UI
    
    private let nameLabel = UILabel()
    private(set) var  underlineView = UIView()
    
    private var isTabSelected: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setUI() {
        contentView.addSubviews(nameLabel, underlineView)
    }
    
    private func setStyle() {
        nameLabel.do {
            $0.font = .reddit(.captionM12)
            $0.textColor = .gray400
            $0.textAlignment = .center
        }
        
        underlineView.do {
            $0.backgroundColor = .black
            $0.isHidden = true
        }
    }
    private func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.horizontalEdges.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Configure
    
    func configure(with tab: String, isSelected: Bool) {
        self.isTabSelected = isSelected
        nameLabel.text = tab
    }
    
    private func updateUI() {
        print("실행")
        nameLabel.textColor = isTabSelected ? .black : .gray400
        underlineView.isHidden = !isTabSelected
    }
}
